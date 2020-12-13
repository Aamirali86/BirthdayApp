//
//  BirthdayListViewController.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit
import Combine

class BirthdayListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:- Properties
    
    private let viewModel: BirthdayListViewModelType
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var loader: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .gray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    init?(coder: NSCoder, viewModel: BirthdayListViewModelType) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        bindViewModel()
    }
    
    //MARK:- Private functions
    
    private func setupUI() {
        title = "Birthdays"
        
        view.addSubview(loader)
        view.bringSubviewToFront(loader)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.registerCell(BirthdayCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bindViewModel() {
        viewModel
            .peoples
            .sink { completion in
            print(completion)
        } receiveValue: { [weak self] peoples in
            self?.tableView.reloadData()
        }
        .store(in: &subscriptions)
        
        viewModel.isLoading
            .map{ !$0 }
            .assign(to: \.isHidden, on: loader)
            .store(in: &subscriptions)
    }
}

extension BirthdayListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BirthdayCell.cellIdentifier, for: indexPath) as? BirthdayCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = BirthdayCellViewModel(people: viewModel.people(at: indexPath.row))
        cell.populate(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickRow(at: indexPath.row)
    }
}

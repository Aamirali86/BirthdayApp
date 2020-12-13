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
        setupTableView()
        bindViewModel()
    }
    
    //MARK:- Private functions
    
    private func setupTableView() {
        tableView.registerCell(BirthdayCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func bindViewModel() {
        
    }
}

extension BirthdayListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BirthdayCell.cellIdentifier, for: indexPath) as? BirthdayCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = BirthdayCellViewModel()
        cell.populate(with: cellViewModel)
        return cell
    }
}

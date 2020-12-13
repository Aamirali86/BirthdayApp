//
//  ProfileViewController.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK:- Outlets
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var age: UILabel!
    @IBOutlet private weak var backButton: UIButton!

    //MARK:- Properties

    private let viewModel: ProfileViewModelType
    
    //MARK:- Init
    
    init?(coder: NSCoder, viewModel: ProfileViewModelType) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK:- Private functions
    
    private func setupUI() {
        backButton.backgroundColor = .black
        backButton.setTitle("GO BACK", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        
        name.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        age.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        name.text = viewModel.name
        age.text = viewModel.age
    }
    
    //MARK:- Action
    @IBAction private func didTapGoBack() {
        viewModel.goBack()
    }
}

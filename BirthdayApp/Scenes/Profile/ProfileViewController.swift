//
//  ProfileViewController.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

class ProfileViewController: UIViewController {
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK:- Private functions
    
    private func setupUI() {
    }
}

//
//  BirthdayListViewController.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

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
        
    }
}

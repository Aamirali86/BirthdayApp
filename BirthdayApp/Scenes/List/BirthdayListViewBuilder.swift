//
//  BirthdayListViewBuilder.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

final class BirthdayListViewBuilder {
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "BirthdayList", bundle: Bundle.main)
        
        let viewModel = BirthdayListViewModel()
        let controller = storyboard.instantiateInitialViewController {
            BirthdayListViewController(coder: $0, viewModel: viewModel)
        }
        
        guard let birthdayListViewController = controller else {
            fatalError("Failed to load BirthdayListViewController from storyboard.")
        }
        
        return birthdayListViewController
    }
}

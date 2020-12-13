//
//  BirthdayListViewBuilder.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

final class BirthdayListViewBuilder {
    func build(with coordinator: BirthdayListCoordinator) -> UIViewController {
        let storyboard = UIStoryboard(name: "BirthdayList", bundle: Bundle.main)
        
        let provider = PeopleProvider()
        let viewModel = BirthdayListViewModel(service: provider, coordinator: coordinator)
        let controller = storyboard.instantiateInitialViewController {
            BirthdayListViewController(coder: $0, viewModel: viewModel)
        }
        
        guard let birthdayListViewController = controller else {
            fatalError("Failed to load BirthdayListViewController from storyboard.")
        }
        
        return birthdayListViewController
    }
}

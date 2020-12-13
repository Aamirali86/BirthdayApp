//
//  ProfileViewBuilder.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

final class ProfileViewBuilder {
    func build(with people: People) -> UIViewController {
        let storyboard = UIStoryboard(name: "Profile", bundle: Bundle.main)
        
        let viewModel = ProfileViewModel(people: people)
        let controller = storyboard.instantiateInitialViewController {
            ProfileViewController(coder: $0, viewModel: viewModel)
        }
        
        guard let profileViewController = controller else {
            fatalError("Failed to load ProfileViewController from storyboard.")
        }
        
        return profileViewController
    }
}

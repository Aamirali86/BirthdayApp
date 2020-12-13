//
//  BirthdayListCoordinator.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

final class BirthdayListCoordinator: BaseCoordinator<UINavigationController> {
    override func start() {
        let listVC = BirthdayListViewBuilder().build(with: self)
        rootViewController.pushViewController(listVC, animated: true)
    }
    
    func navigateToProfile(with people: People) {
        let profileVC = ProfileViewBuilder().build(with: people, coordinator: self)
        rootViewController.pushViewController(profileVC, animated: true)
    }
    
    func goBack() {
        rootViewController.popViewController(animated: true)
    }
}

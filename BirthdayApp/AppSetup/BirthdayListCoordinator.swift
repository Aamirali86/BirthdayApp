//
//  BirthdayListCoordinator.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

final class BirthdayListCoordinator: BaseCoordinator<UINavigationController> {
    override func start() {
        let listVC = BirthdayListViewBuilder().build()
        rootViewController.pushViewController(listVC, animated: true)
    }
}

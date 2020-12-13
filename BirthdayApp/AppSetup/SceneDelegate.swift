//
//  SceneDelegate.swift
//  BirthdayApp
//
//  Created by Amir on 13/12/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let coordinator = AppCoordinator(window: window)
        self.window = window
        self.coordinator = coordinator
        coordinator.start()
    }
}

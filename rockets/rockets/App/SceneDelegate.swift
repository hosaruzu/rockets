//
//  SceneDelegate.swift
//  rockets
//
//  Created by Artem Tebenkov on 29.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = createEntryPoint()
        window?.makeKeyAndVisible()
    }

    private func createEntryPoint() -> UINavigationController {
        let viewController = RocketsViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        RocketsModuleAssembly.build(with: viewController)
        return navigationController
    }
}

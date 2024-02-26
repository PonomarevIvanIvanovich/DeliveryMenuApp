//
//  SceneDelegate.swift
//  DeliveryMenuApp
//
//  Created by Иван Пономарев on 13.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationBar = UINavigationController()
        let viewController = AssemblyBuilderMainScreen.createModul(navigationController: navigationBar)
        navigationBar.viewControllers = [viewController]
        navigationBar.isNavigationBarHidden = false
        window.rootViewController = navigationBar
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
}


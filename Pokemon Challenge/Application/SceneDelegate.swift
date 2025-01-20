//
//  SceneDelegate.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var mainNavigation: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)

        let rootScene = PokemonsFactory.makeModule()
        let navigation = UINavigationController(rootViewController: rootScene)
        self.mainNavigation = navigation
        
        let launchScreen = LaunchScreenViewController()
        launchScreen.onFinishAnimation = { [weak self] in
            self?.showMainScreen()
        }
        
        window.rootViewController = launchScreen
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func showMainScreen() {
        guard let navigation = mainNavigation else { return }
        
        UIView.transition(with: window!,
                         duration: 0.5,
                         options: .transitionCrossDissolve,
                         animations: {
            self.window?.rootViewController = navigation
        })
    }
} 

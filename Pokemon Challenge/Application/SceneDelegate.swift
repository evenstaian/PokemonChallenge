//
//  SceneDelegate.swift
//  Pokemon Challenge
//
//  Created by Evens Taian on 19/01/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let rootScene = PokemonsFactory.makeModule()
        let navigation = UINavigationController(rootViewController: rootScene)
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
    }
} 

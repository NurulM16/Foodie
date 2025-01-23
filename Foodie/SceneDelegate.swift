//
//  SceneDelegate.swift
//  Foodie
//
//  Created by Nurul Mustika on 25/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        //initial VIPER Module
//        let initialViewController = SearchRecipesRouter.createModule()
        let initialViewController = MainMenuRouter.createModule()
        
        let navigationController = UINavigationController(rootViewController: initialViewController)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
    }


}


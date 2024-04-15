//
//  SceneDelegate.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 14.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions){
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainViewController = OnboardingVC()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

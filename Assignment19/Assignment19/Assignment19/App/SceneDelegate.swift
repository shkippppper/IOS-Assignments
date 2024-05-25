//
//  SceneDelegate.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 02.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions){
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let mainViewControllerViewModel = CatFactsListingViewModel()
        let mainViewController = CatFactsListingVC(viewModel: mainViewControllerViewModel)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

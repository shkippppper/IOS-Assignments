//
//  SceneDelegate.swift
//  Assignment12
//
//  Created by Akaki Titberidze on 10.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions){
        guard let scene = (scene as? UIWindowScene) else { return }

//        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
    }
    
    func createZodiacNavigationController() -> UINavigationController {
        let zodiacVC = ViewController()
        zodiacVC.title = "Zodiac"
        zodiacVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: zodiacVC)
    }
    
    func createSyllabusNavigationController() -> UINavigationController{
        let syllabusVC = SyllabusVC()
        syllabusVC.title = "Syllabus"
        syllabusVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        
        return UINavigationController(rootViewController: syllabusVC)
    }
    
    func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemCyan
        tabbar.viewControllers = [createZodiacNavigationController(), createSyllabusNavigationController()]
        
        return tabbar
    }
    
}

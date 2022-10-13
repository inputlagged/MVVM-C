//
//  AppDelegate.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/11/22.
//

import UIKit
import Swinject

@main
internal final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var assembly: Assembly!
    var container: Container = .init()
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController()
        assembly = Assembly(container: container)
        coordinator = ApplicationCoordinator(navigationController: navigationController, assembly: assembly, container: container)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        coordinator?.start()
        
        return true
    }
}


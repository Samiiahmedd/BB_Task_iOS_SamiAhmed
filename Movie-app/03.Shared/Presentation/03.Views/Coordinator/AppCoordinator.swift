//
//  AppCoordinator.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 07/10/2024.
//

import UIKit
import SwiftUI

class AppCoordinator {
    
    var windo: UIWindow?
    var isLogin = false

    let router: Router
    
    static let shared = AppCoordinator()
    
    init() {
        self.router = AppRouter(navigationController: .init())
        self.router.navigationController.isNavigationBarHidden = true
    }
}

// MARK: - Main Coordinatot
extension AppCoordinator: Coordinator {
    func makeWindow(from windoScene: UIWindowScene) {
        let windo = UIWindow(windowScene: windoScene)
        windo.rootViewController = self.router.navigationController
        windo.makeKeyAndVisible()
        self.windo = windo
    }
    
    func resetWindo() {
        guard let window = windo else { return }
        window.rootViewController = self.router.navigationController
        window.makeKeyAndVisible()
        self.windo = window
    }
    
    func start() {
        showSplash()
    }
    
    func showSplash() {
        let view = SplashView()
        let viewController = UIHostingController(rootView: view)
        guard let window = windo else { return }
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight) {
            window.rootViewController = viewController
        }
    }

    func showHome() {
        guard let window = windo else { return }
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight) {
            self.resetWindo()
        }
        let homeCoordinator = HomeCoordinator(router: router)
        homeCoordinator.start()
    }
}

//
//  Coordinator.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 07/10/2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var router: Router { get }
    var currentViewController: UIViewController { get }
    
    func start()
}

extension Coordinator {
    var currentViewController: UIViewController {
        return router.navigationController.visibleViewController!
    }
    
    func dismiss(completion: @escaping () -> Void = {} ) {
        router.dismiss(animated: true, completion: completion)
    }
    
    func dismissPopup(completion: @escaping () -> Void = { }) {
        router.dismissPopup { [weak self] in
            self?.router.dismiss(animated: false, completion: completion)
        }
    }
    
    func popToRoot(completion: @escaping () -> Void = { }) {
        router.popToRoot(animated: false, completion: completion)
    }
    
    func pop() {
        router.pop(animated: true, completion: {})
    }
    
    func popToViewController<T: UIViewController>(ofType type: T.Type, animated: Bool = true) {
        if let viewController = router.navigationController.viewControllers.first(where: { $0 is T }) {
            router.navigationController.popToViewController(viewController, animated: animated)
        }
    }

    func showAlert(alert: UIAlertController) {
        router.present(alert)
    }
    

    
    func openURLInSafari(_ urlString: String) {
        guard let url = URL(string: urlString),
              UIApplication.shared.canOpenURL(url) else {
            print("Invalid or unsupported URL")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

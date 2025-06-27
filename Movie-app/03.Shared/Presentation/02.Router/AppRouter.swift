
import UIKit

final class AppRouter {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AppRouter: Router {
    public func present(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func presentOverFullScreen(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func customPresent(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        viewController.modalPresentationStyle = .custom
        self.present(viewController, animated: animated, completion: completion)
    }
    
    public func dismiss(animated: Bool = true, completion: @escaping () -> Void = {}) {
        if navigationController.presentedViewController != nil {
            navigationController.dismiss(animated: animated, completion: completion)
        } else {
            navigationController.popViewController(animated: animated)
            completion()
        }
    }
    
    public func push(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.pushViewController(viewController, animated: animated)
        completion()
    }
    

    public func pushRTL(_ viewController: UIViewController, animated: Bool = true, completion: @escaping () -> Void = {}) {
        let isRTL = Locale.characterDirection(forLanguage: Locale.current.languageCode ?? "") == .rightToLeft
        if isRTL {
            let transition = CATransition()
            transition.type = .push
            transition.subtype = .fromRight
            transition.duration = 0.3
            
            navigationController.view.layer.add(transition, forKey: kCATransition)
        }
        navigationController.pushViewController(viewController, animated: false)
        completion()
    }

    
    public func reset(completion: @escaping () -> Void) {
        navigationController.dismiss(animated: false)
        navigationController.viewControllers.removeAll()
    }
    
    func pop(animated: Bool, completion: @escaping () -> Void) {
        navigationController.popViewController(animated: animated)
    }
    
    public func popToViewController(
        _ viewController: UIViewController,
        animated: Bool = true,
        completion: @escaping () -> Void = {}
    ) {
        navigationController.popToViewController(viewController, animated: animated)
        completion()
    }
    
    public func popToRoot(animated: Bool = true, completion: @escaping () -> Void = {}) {
        navigationController.popToRootViewController(animated: animated)
        completion()
    }
}

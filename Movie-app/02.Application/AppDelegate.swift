
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppConfiguration.configure(application)
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
}

extension UIApplication {
    func addTapGestureRecognizer() {
        if let window = connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene {
            if let firstWindow = window.windows.first {
                let tapGesture = UITapGestureRecognizer(target: firstWindow, action: #selector(UIView.endEditing))
                tapGesture.requiresExclusiveTouchType = false
                tapGesture.cancelsTouchesInView = false
                firstWindow.addGestureRecognizer(tapGesture)
            }
        }
    }
}

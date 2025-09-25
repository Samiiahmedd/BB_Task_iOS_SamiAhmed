
import NetworkLayer
import UIKit

class AppConfiguration {
    /// Network Layer
    struct NetworkLayerConfigurations {
        static func configure() async {
            let netowrkManager = NetworkConfigurationManager.shared
            await netowrkManager.setBaseURL("api.themoviedb.org")
            await netowrkManager.setResourcePath("3")
            #if DEBUG
            await netowrkManager.setLoggerEnabled(true)
            #endif
        }
    }
        
    /// Configuration
    @MainActor static func configure(_ app: UIApplication) {
        Task {
            await NetworkLayerConfigurations.configure()
        }
    }
}

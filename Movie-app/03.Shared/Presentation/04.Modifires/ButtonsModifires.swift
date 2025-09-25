
import SwiftUI

extension View {
    func singleBackButtonConfig() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
    }
}

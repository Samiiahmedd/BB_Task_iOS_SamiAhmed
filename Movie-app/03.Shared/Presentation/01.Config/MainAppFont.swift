
import SwiftUI

enum FontName: String {
    case expoArabic = "ExpoArabic-"
}

enum FontWeight: String {
    case black = "Black"
    case extraBold = "ExtraBold"
    case bold = "Bold"
    case semiBold = "SemiBold"
    case medium = "Medium"
    case regular = "Regular"
    case light = "Light"
    case extraLight = "ExtraLight"
}

struct AppFonts: ViewModifier {
    
    /// Properties
    var size: CGFloat
    var fontName: FontName
    var weight: FontWeight
    var minimumScaleFactor: CGFloat
    var fontString: String {
        fontName.rawValue + weight.rawValue
    }
    
    /// Modifire
    func body(content: Content) -> some View {
        return content
            .font(.custom(fontString, size: size))
            .minimumScaleFactor(minimumScaleFactor)
    }
}


extension View {
    func appFont(size: CGFloat = 12, font: FontName = .expoArabic, weight: FontWeight = .regular, minimumScaleFactor: CGFloat = 0.5) -> some View {
        self.modifier(AppFonts(size: size, fontName: font, weight: weight, minimumScaleFactor: minimumScaleFactor))
    }
}

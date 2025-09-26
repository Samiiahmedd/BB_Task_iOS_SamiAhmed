//
//  String.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 14/11/2024.
//

import UIKit

extension String {
    
    func trim() -> String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func localized(from tableName: LocalizationFiles, in bundle: Bundle = .main) -> String {
        return NSLocalizedString(self, tableName: tableName.rawValue, bundle: bundle, comment: "")
    }
    
    func localized(with args: CVarArg..., from tableName: LocalizationFiles) -> String {
        return String(format: self.localized(from: tableName), args)
    }
    
//    func isValid(for type: ValidatorTypes) -> Bool {
//        return Validator.validate(self, for: type)
//    }
    
    func convertToEnglishLocale() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        if let number = formatter.number(from: self) {
            return formatter.string(from: number) ?? self
        } else {
            return self
        }
    }
    
    func hashEmail() -> String {
        let components = self.components(separatedBy: "@")
        guard components.count == 2 else { return self }
        
        let localPart = components[0]
        let domainPart = components[1]
        
        let hiddenCharacterCount = max(localPart.count - 2, 0)
        
        let stars = String(repeating: "*", count: hiddenCharacterCount)
        
        let maskedLocalPart = String(localPart.prefix(2)) + stars
        
        return "\(maskedLocalPart)@\(domainPart)"
    }
    
    func hashPhone() -> String {
        let cleanedPhone = self.filter { $0.isNumber } // Remove any non-numeric characters
        guard cleanedPhone.count >= 2 else { return self }

        let visibleDigits = String(cleanedPhone.suffix(2))
        let hiddenDigitsCount = cleanedPhone.count - 2
        let maskedPart = String(repeating: "*", count: hiddenDigitsCount)

        return maskedPart + visibleDigits
    }
    
//    func applyColorAndUnderline(_ char: String, color: UIColor = .appColor(.primary)) -> NSMutableAttributedString {
//        let attributedString = NSMutableAttributedString(string: self)
//        
//        let range = (self as NSString).range(of: char)
//        
//        attributedString.addAttribute(.foregroundColor, value: color, range: range)
//        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
//        
//        return attributedString
//    }
}

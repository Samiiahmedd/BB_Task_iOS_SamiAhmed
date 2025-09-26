//
//  String+Numerical.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 04/12/2024.
//

import Foundation

extension String {
    var numericString: String? {
        let pattern = "[0-9]+(?:\\.[0-9]+)?"
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        
        if let match = regex?.firstMatch(in: self, options: [], range: range),
           let matchRange = Range(match.range, in: self) {
            return String(self[matchRange])
        }
        return nil
    }
    
    func extractNumbersOnly() -> String {
        let filtered = self.filter { $0.isNumber || $0 == "." }
        if let doubleValue = Double(filtered) {
            return doubleValue.truncatingRemainder(dividingBy: 1) == 0 ? "\(Int(doubleValue))" : "\(doubleValue)"
        }
        return filtered
    }
    
    func asHTMLAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: .utf8) else { return nil }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        do {
            return try NSAttributedString(data: data, options: options, documentAttributes: nil)
        } catch {
            print("Failed to parse HTML: \(error)")
            return nil
        }
    }
}

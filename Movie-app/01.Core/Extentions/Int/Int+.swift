//
//  Int+.swift
//  Movie-app
//
//  Created by Sami on 26/06/2025.
//

import Foundation

extension Int {
    func formattedWithSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

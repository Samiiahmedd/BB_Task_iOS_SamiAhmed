//
//  String+Date.swift
//  AseerAlkotb
//
//  Created by Abdalazem Saleh on 18/02/2025.
//

import Foundation

extension String {
    func toDate(format: String = "MM/dd/yyyy") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return .now
        }
    }
}

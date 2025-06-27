//
//  LocalizationFiles.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 14/11/2024.
//

import Foundation

enum LocalizationFiles: String {
    case MainApp
    
    init(rawValue: String) {
        switch rawValue {
        case "MainApp": self = .MainApp
        default: self = .MainApp
        }
    }
}

let currentLanguage = Locale.current.languageCode

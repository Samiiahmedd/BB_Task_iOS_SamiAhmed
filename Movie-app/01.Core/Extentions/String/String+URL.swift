//
//  String+URL.swift
//  eTrip
//
//  Created by Abdalazem Saleh on 09/12/2024.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}

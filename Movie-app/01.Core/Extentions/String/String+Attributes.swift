//
//  String+Attributes.swift
//  AseerAlkotb
//
//  Created by alamiya on 11/08/1446 AH.
//

import UIKit

extension String {
    func coloredText(wordsWithColors: [UIColor: [String]]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for (color, words) in wordsWithColors {
            for word in words {
                let range = (self as NSString).range(of: word)
                if range.location != NSNotFound {
                    attributedString.addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        return attributedString
    }
}

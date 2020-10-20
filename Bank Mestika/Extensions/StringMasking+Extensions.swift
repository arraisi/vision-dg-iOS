//
//  StringMasking+Extensions.swift
//  Bank Mestika
//
//  Created by Prima Jatnika on 20/10/20.
//

import Foundation

extension String {
    
    func replace(myString: String, _ index: [Int], _ newChar: Character) -> String {
        var chars = Array(myString)
        if chars.count > 5 {
            for data in index {
                chars[data] = newChar
            }
        }

        let modifiedString = String(chars)
        return modifiedString
    }
    
}

//
//  String+HTMLCheck.swift
//  News
//
//  Created by Thomas Schatton on 24.07.22.
//

import Foundation

extension String {
    func isValidHTML() -> Bool {
        if self.isEmpty {
            return false
        }
        
        return (self.range(of: "<(\"[^\"]*\"|'[^']*'|[^'\">])*>", options: .regularExpression) != nil)
    }
}

//
//  UserSettings.swift
//  News
//
//  Created by Thomas Schatton on 07.07.22.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var categoryToggleOn = false
    @Published var periodToggleOn = false
    
    @Published var language: Language = .de
//    @Published var country: Country = .de
    @Published var category: Category = .general
    
    // needs to be optional, due to use in network call
    var from: Date? = nil
    var to: Date? = nil
    
    private var iso8601formatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ .withFullDate ]
        return formatter
    }
    
    var dateFrom: String? {
        if from != nil {
            return iso8601formatter.string(from: from!)
        }
        return nil
    }

    var dateTo: String? {
        if to != nil {
            return iso8601formatter.string(from: to!)
        }
        return nil
    }

    func resetSettings() {
        categoryToggleOn = false
        periodToggleOn = false
        language = .de
//        country = .de
        category = .general
        from = nil
        to = nil
    }
}

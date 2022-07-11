//
//  SearchSerttings.swift
//  News
//
//  Created by Thomas Schatton on 07.07.22.
//

import Foundation

class SearchSettings: ObservableObject {
    @Published var searchText: String = ""
    @Published var periodToggleOn = false
    @Published var sortToggleOn = false
    
    @Published var language: Language = .de
    @Published var sortBy: SortBy = .publishedAt
    
    // needs to be optional, due to use in network call
    @Published var from: Date = .now
    @Published var to: Date = .now
    
    private var iso8601formatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ .withFullDate ]
        return formatter
    }
    
    var dateFrom: String? {
        if periodToggleOn {
            return iso8601formatter.string(from: from)
        }
        return nil
    }

    var dateTo: String? {
        if periodToggleOn {
            return iso8601formatter.string(from: to)
        }
        return nil
    }

    func resetSettings() {
        periodToggleOn = false
        sortToggleOn = false
        
        searchText = ""
        language = .de
        sortBy = .publishedAt
        from = .now
        to = .now
    }
}

//
//  UserSettings.swift
//  News
//
//  Created by Thomas Schatton on 07.07.22.
//

import Foundation

class HeadlineSettings: ObservableObject {
    @Published var language: Language = .en
    @Published var category: Category = .general

    func resetSettings() {
        language = .en
        category = .general
    }
}

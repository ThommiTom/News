//
//  UserSettings.swift
//  News
//
//  Created by Thomas Schatton on 07.07.22.
//

import Foundation

class HeadlineSettings: ObservableObject {
    @Published var language: Language = .de
    @Published var category: Category = .general

    func resetSettings() {
        language = .de
        category = .general
    }
}

//
//  NewsParameters.swift
//  News
//
//  Created by Thomas Schatton on 05.07.22.
//

import Foundation

enum Country: String {
    case at, ca, fr, de, jp, nl, pl, ru, ua, ue, gb, us
}

let countries: Dictionary<String, Country> = [
    "Austria": .at,
    "Canada": .ca,
    "France": .fr,
    "Germany": .de,
    "Japan": .jp,
    "Netherlands": .nl,
    "Poland": .pl,
    "Russia": .ru,
    "Ukraine": .ua,
    "United Arab Emirates": .ue,
    "United Kingdom": .gb,
    "United States": .us,
    
]

enum Category: String {
    case business, entertainment, general, health, science, sports, technology
}

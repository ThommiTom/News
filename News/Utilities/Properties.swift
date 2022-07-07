//
//  NewsParameters.swift
//  News
//
//  Created by Thomas Schatton on 05.07.22.
//

import Foundation

enum Language: String {
    case de, en, es, fr, it, nl
}

enum Country: String {
    case at, ca, fr, de, jp, nl, pl, ru, ua, ue, gb, us
}

enum Category: String {
    case business, entertainment, general, health, science, sports, technology
}

enum SortBy: String {
    case relevancy, popularity, publishedAt
}


let languages: Array<Language> = [ .de, .en, .es, .fr, .it, .nl ]
let countries: Array<Country> = [ .at, .ca, .fr, .de, .jp, .nl, .pl, .ue, .gb, .us]
let categories: Array<Category> = [ .business, .entertainment, .general, .health, .science, .sports, .technology]
let sortings: Array<SortBy> = [ .popularity, .publishedAt, .relevancy]

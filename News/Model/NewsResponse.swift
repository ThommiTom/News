//
//  NewsResponse.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable, Hashable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String
}

struct Source: Codable, Hashable {
    let id: String?
    let name: String
}

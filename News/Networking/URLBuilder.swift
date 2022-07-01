//
//  URLBuilder.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

import Foundation

class URLBuilder {
    static let shared = URLBuilder()
    private var urlComponents = URLComponents()
    
    private init() {
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
    }
        
    func createEverythingURL(searchFor q: String) -> URL {
        urlComponents.path = "/v2/everything"

        let querySearch = URLQueryItem(name: "q", value: q)
//        let queryLanguage = URLQueryItem(name: "language", value: "en")
//        let queryDomain = URLQueryItem(name: "domains", value: "techcrunch.com")
//        let querySortBy = URLQueryItem(name: "sortBy", value: "popularity")
        let queryKey = URLQueryItem(name: "apiKey", value: apiKey)
        
        urlComponents.queryItems = [querySearch, queryKey]
        
        guard let url = urlComponents.url else {
            fatalError("URL construction failed!")
        }
        
        return url
    }
}

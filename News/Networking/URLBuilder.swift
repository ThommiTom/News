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
    
    func createEverythingURL(searchFor q: String, in language: Language?, from: String?, to: String?, sortBy: SortBy?) -> URL {
        urlComponents.path = "/v2/everything"

        var items: [URLQueryItem] = [ URLQueryItem(name: "apiKey", value: apiKey), URLQueryItem(name: "q", value: q) ]
        
        if let language = language {
            items.append(URLQueryItem(name: "language", value: language.rawValue))
        }
        
        if from != nil && to != nil {
            items.append(URLQueryItem(name: "from", value: from!))
            items.append(URLQueryItem(name: "to", value: to!))
        }
        
        if let sortBy = sortBy {
            items.append(URLQueryItem(name: "sortBy", value: sortBy.rawValue))
        }
        
        urlComponents.queryItems = items
        
        guard let url = urlComponents.url else {
            fatalError("URL construction failed!")
        }
        
        print(url.absoluteString)
        
        return url
    }
    
    func createHeadlineURL(for category: Category?, in language: Language?) -> URL {
        urlComponents.path = "/v2/top-headlines"
        
        var items: [URLQueryItem] = [URLQueryItem(name: "apiKey", value: apiKey)]
        
        if let category = category {
            items.append(URLQueryItem(name: "category", value: category.rawValue))
        }
        
        if let language = language {
            items.append(URLQueryItem(name: "language", value: language.rawValue))
        }
        
        urlComponents.queryItems = items
        
        guard let url = urlComponents.url else {
            fatalError("URL construction failed!")
        }
        
        print(url.absoluteString)
        
        return url
    }
}

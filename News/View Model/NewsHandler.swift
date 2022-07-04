//
//  NewsHandler.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import Foundation

class NewsHandler: ObservableObject {
    @Published var fetchedArticles: [Article] = []
    @Published var favoriteArticles: [Article]?
    
    func fetchNews(_ q: String) async {
        if !q.isEmpty {
            await NetworkManager.shared.getNews(searchFor: q) { result in
                switch result {
                case .success(let newsResponse):
                        DispatchQueue.main.async {
                            self.fetchedArticles = newsResponse.articles
                        }
                case .failure(let error):
                    print("ERROR - \(error.rawValue)")
                }
            }
        }
    }
}

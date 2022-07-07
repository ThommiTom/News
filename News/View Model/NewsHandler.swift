//
//  NewsHandler.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import Foundation

class NewsHandler: ObservableObject {
    @Published var articles: [Article] = []
    @Published var headlines: [Article] = []
    @Published var favoriteArticles: [Article] = []
    
    func fetchNews(_ q: String, in language: Language, from: String?, to: String?, sortBy: SortBy) async {
        if !q.isEmpty {
            await NetworkManager.shared.getNews(searchFor: q, in: language, from: from, to: to, sortBy: sortBy) { result in
                switch result {
                case .success(let newsResponse):
                    DispatchQueue.main.async {
                        self.articles = newsResponse.articles
                    }
                case .failure(let error):
                    print("ERROR - \(error.rawValue)")
                }
            }
        }
    }
    
    func fetchHeadlines(for category: Category?, in language: Language?) async {
        await NetworkManager.shared.getHeadlines(for: category, in: language) { result in
            switch result {
            case .success(let newsResponse):
                DispatchQueue.main.async {
                    self.headlines = newsResponse.articles
                }
            case .failure(let error):
                print("ERROR - \(error.rawValue)")
            }
        }
    }
}

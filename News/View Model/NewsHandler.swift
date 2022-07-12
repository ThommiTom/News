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
    @Published var readingList: [Article] = []
    
    @Published var customArticles: [CustomArticle] = []
    @Published var customHeadlines: [CustomArticle] = []
    @Published var customReadingList: [CustomArticle] = []
    
    func fetchNews(_ q: String, in language: Language, from: String?, to: String?, sortBy: SortBy) async {
        if !q.isEmpty {
            await NetworkManager.shared.getNews(searchFor: q, in: language, from: from, to: to, sortBy: sortBy) { result in
                switch result {
                case .success(let newsResponse):
                    DispatchQueue.main.async {
                        self.articles = newsResponse.articles
                        
                        for article in newsResponse.articles {
                            self.customArticles.append(CustomArticle(article: article, inReadingList: false))
                        }
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
                    
                    for article in newsResponse.articles {
                        self.customHeadlines.append(CustomArticle(article: article, inReadingList: false))
                    }
                }
            case .failure(let error):
                print("ERROR - \(error.rawValue)")
            }
        }
    }
    
    func addToReadingList(customArticle: CustomArticle) {
        objectWillChange.send()
        var temp = customArticle
        temp.inReadingList = true
        customReadingList.append(temp)
    }
    
}

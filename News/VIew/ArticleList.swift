//
//  ArticleList.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct ArticleList: View {
    @State private var articles: Array<Article>
    
    init(articles: Array<Article>?) {
        if let articles = articles {
            _articles = State(initialValue: articles)
        } else {
            self.articles = Array<Article>()
        }
        
    }
    
    var body: some View {
        List {
            ForEach(articles, id: \.self) { article in
                HStack(spacing: 10) {
                    if let urlToImage = article.urlToImage {
                        AsyncImage(url: URL(string: urlToImage)) { image in
                            image.resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: SwiftUI.RoundedCornerStyle.continuous))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(article.source?.name ?? "nil")
                            .font(.caption)
                            .opacity(0.7)
                        Text(article.title ?? "nil")
                            .font(.headline)
                            
                        Text(article.description ?? "")
                            .font(.caption)
                            .opacity(0.7)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList(articles: [Article.example, Article.example])
    }
}

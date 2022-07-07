//
//  ArticleList.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct ArticleList: View {
    @Environment(\.dismissSearch) var dismissSearch
    
    @Binding var articles: Array<Article>
    
    var body: some View {
        List {
            ForEach(articles, id: \.self) { article in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(article.source?.name ?? "nil")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Spacer()

                        Text(article.publishedAt?.formatted(date: .abbreviated, time: .omitted) ?? "nil")
                            .font(.caption)
                            .opacity(0.7)
                    }
                    
                    Text(article.title ?? "nil")
                        .font(.headline)
                    
                    Text(article.description ?? "")
                        .font(.caption)
                        .opacity(0.7)
                }
            }
            .onChange(of: articles) { _ in
                dismissSearch()
            }
        }
        .listStyle(.plain)
        
    }
}

struct ArticleList_Previews: PreviewProvider {
    static var previews: some View {
        ArticleList(articles: Binding<[Article]>.constant([Article.example, Article.example]))
    }
}

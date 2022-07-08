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
            ForEach($articles, id: \.self) { article in
                NavigationLink {
                    ArticleDetailsView(article: article)
                } label: {
                    ArticleRowView(article: article)
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
        ArticleList(articles: Binding<[Article]>.constant([Article.example, Article.example, Article.example]))
    }
}

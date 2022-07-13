//
//  CompactArticleView.swift
//  News
//
//  Created by Thomas Schatton on 13.07.22.
//

import SwiftUI

struct CompactArticleView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    
    var body: some View {
        List {
            ForEach(newsHandler.readingList, id: \.self) { item in
                Text(item.article.title ?? "")
//                ArticleHeaderView(article: item.article, showHeadline: true)
            }
            .onDelete(perform: newsHandler.deleteArticle)
        }
        .navigationTitle("Reading List")
        .listStyle(.plain)
    }
}

struct CompactArticleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactArticleView()
    }
}

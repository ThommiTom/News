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
            ForEach($newsHandler.readingList, id: \.self) { $item in
                NavigationLink {
                    Text("Now we read the article \(item.article.title ?? "nil")")
                } label: {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.blue)
                            .opacity(item.articleRead ? 0.0 : 0.7)
                            .scaleEffect(0.5)
                        ArticleHeaderView(article: $item.article, showHeadline: true)
                    }
                }
            }
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

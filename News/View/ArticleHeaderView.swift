//
//  ArticleHeaderView.swift
//  News
//
//  Created by Thomas Schatton on 08.07.22.
//

import SwiftUI

struct ArticleHeaderView: View {
    @Binding var article: Article
    var showHeadline: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                if let sourceName = article.source?.name {
                    Text(sourceName)
                        .font(.caption)
                        .opacity(0.7)
                }
                Spacer()
                if let publishedAt = article.publishedAt {
                    Text(publishedAt.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .opacity(0.7)
                }
            }
            
            if showHeadline {
                if let headline = article.title {
                    Text(headline)
                        .font(.headline)
                }
            }
        }
    }
}

struct ArticleHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleHeaderView(article: Binding<Article>.constant(Article.example), showHeadline: false)
    }
}

//
//  ArticleRowView.swift
//  News
//
//  Created by Thomas Schatton on 08.07.22.
//

import SwiftUI

struct ArticleRowView: View {
    @Binding var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ArticleHeaderView(article: $article, showHeadline: true)
            
            if let description = article.description {
                Text(description)
                    .font(.caption)
                    .opacity(0.7)
            }
        }
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Binding<Article>.constant(Article.example))
    }
}

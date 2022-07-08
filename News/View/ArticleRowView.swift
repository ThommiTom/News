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
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRowView(article: Binding<Article>.constant(Article.example))
    }
}

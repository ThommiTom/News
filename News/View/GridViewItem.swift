//
//  GriedViewItem.swift
//  News
//
//  Created by Thomas Schatton on 17.07.22.
//

import SwiftUI

struct GridViewItem: View {
    @Binding var readingListItem: ReadingListItem
    
    var body: some View {
        VStack {
            ZStack {
                Text(readingListItem.article.source?.name ?? "")
                    .font(.caption)
                    .opacity(0.7)
                    .foregroundColor(.black)
                
                HStack {
                    Image(systemName: "circle.fill")
                        .opacity(readingListItem.articleRead ? 0.0 : 0.7)
                        .foregroundColor(.blue)
                        .scaleEffect(0.5)
                    
                    Spacer()
                }
            }
            .padding(.top, 3)
            
            AsyncImage(url: URL(string: readingListItem.article.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .padding()
            }
            
            if let publishedAt = readingListItem.article.publishedAt {
                Text(publishedAt.formatted(date: .abbreviated, time: .omitted))
                    .opacity(0.7)
                    .foregroundColor(.black)
                    .font(.caption2)
            }
            
            Text(readingListItem.article.title ?? "")
                .multilineTextAlignment(.leading)
                .font(.caption2)
                .foregroundColor(.black)
                .opacity(0.7)
                .padding(.horizontal)
                .padding(.top, 1)
                .padding(.bottom, 5)
        }
        .frame(width: 160)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .contentShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct GriedViewItem_Previews: PreviewProvider {
    static var previews: some View {
        GridViewItem(readingListItem: Binding<ReadingListItem>.constant(ReadingListItem.init(article: Article.example)))
    }
}

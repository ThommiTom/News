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
                    ReadingListArticleDetailsView(item: $item)
                } label: {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.blue)
                            .opacity(item.articleRead ? 0.0 : 0.7)
                            .scaleEffect(0.5)
                        ArticleHeaderView(article: $item.article, showHeadline: true)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    if item.articleRead {
                        Button {
                            newsHandler.toggleReadingState(item: $item)
                        } label: {
                            Label {
                                Text("Mark as unread")
                            } icon: {
                                Image(systemName: "eyeglasses")
                                    .foregroundColor(.blue)
                            }
                        }
                        .tint(.blue.opacity(0.8))
                    } else {
                        Button {
                            newsHandler.toggleReadingState(item: $item)
                        } label: {
                            Label {
                                Text("Mark as read")
                            } icon: {
                                Image(systemName: "eyeglasses")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button("Delete", role: .destructive) {
                        newsHandler.deleteItem(item: item)
                    }
                }
            }
            //.onDelete(perform: newsHandler.deleteArticle) // if swipeActions are used swiftUI stops sythentising onDelete function
        }
    }
}

struct CompactArticleView_Previews: PreviewProvider {
    static var previews: some View {
        CompactArticleView()
            .environmentObject(NewsHandler())
    }
}

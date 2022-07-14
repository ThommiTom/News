//
//  ReadingListArticleDetailsViews.swift
//  News
//
//  Created by Thomas Schatton on 14.07.22.
//

import SwiftUI

struct ReadingListArticleDetailsView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    @Binding var item: ReadingListItem
    
    var body: some View {
        ArticleDetailsView(article: $item.article)
            .onDisappear {
                newsHandler.setAsRead(item: $item)
            }
    }
}

struct ReadingListArticleDetailsViews_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListArticleDetailsView(item: Binding<ReadingListItem>.constant(ReadingListItem.init(article: Article.example)))
    }
}

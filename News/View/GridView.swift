//
//  GridView.swift
//  News
//
//  Created by Thomas Schatton on 17.07.22.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    
    let columns = [ GridItem(.adaptive(minimum: 150, maximum: 180)) ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach($newsHandler.readingList, id: \.self) { $item in
                    NavigationLink {
                        ReadingListArticleDetailsView(item: $item)
                    } label: {
                        GridViewItem(readingListItem: $item)
                    }
                    .contextMenu {
                        Button(item.articleRead ? "Mark as unread" : "Mark as read") {
                            item.articleRead.toggle()
                        }
                        Button("Delete", role: .destructive) {
                            newsHandler.deleteItem(item: item)
                        }
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(NewsHandler())
    }
}

//
//  FavoriteView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct ReadingListView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    @State private var showingCompactView = true
    
    var body: some View {
        NavigationView {
            ZStack {
                PlaceholderView(sfSymbolName: "eyeglasses", message: "Currently your reading list is empty", hint: "Add articles to your reading list by using swipe gestures in the Headline or Search tab.")
                    .opacity(newsHandler.readingList.isEmpty ? 1.0 : 0.0)
                
               if showingCompactView {
                    CompactArticleView()
                } else {
                    Text("GridView is coming here")
                }
            }
            .navigationTitle("Reading List")
            .listStyle(.plain)
            .toolbar {
                Button {
                    showingCompactView.toggle()
                } label: {
                    Image(systemName: showingCompactView ? "square.grid.2x2" : "list.dash")
                }
                .opacity(newsHandler.readingList.count == 0 ? 0.0 : 1.0)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
            .environmentObject(NewsHandler())
    }
}

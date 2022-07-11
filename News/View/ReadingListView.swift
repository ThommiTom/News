//
//  FavoriteView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct ReadingListView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    
    var body: some View {
        NavigationView {
            List {
                ForEach(newsHandler.readingList, id: \.self) { article in
                    Text(article.title ?? "nil")
                }
            }
            .navigationTitle("Reading List")
            .listStyle(.plain)
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}

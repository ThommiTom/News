//
//  FavoriteView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct ReadingListView: View {
    @State private var showingCompactView = true
    
    var body: some View {
        NavigationView {
            Group {
                if showingCompactView {
                    CompactArticleView()
                    Button {
                        showingCompactView.toggle()
                    } label: {
                        Image(systemName: showingCompactView ? "list.dash" : "square.grid.2x2")
                    }
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
                    Image(systemName: showingCompactView ? "list.dash" : "square.grid.2x2")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}

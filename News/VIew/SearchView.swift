//
//  SearchView.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var newsHandler = NewsHandler()
    
    @State private var searchText = ""
    @State var showSearchSheet = false
    
    var body: some View {
        ArticleList(articles: $newsHandler.fetchedArticles)
            .navigationTitle("News Search...")
            .sheet(isPresented: $showSearchSheet) {
                Task {
                    await newsHandler.fetchNews(searchText)
                }
            } content: {
                SearchQuestionnaire(searchText: $searchText)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSearchSheet = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .padding()
                    }

                }
            }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}

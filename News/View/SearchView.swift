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
    
    var body: some View {
        NavigationView {
            ArticleList(articles: $newsHandler.fetchedArticles)
                .navigationTitle("News Search")
                .searchable(text: $searchText, prompt: "Search the web for ...")
                .onSubmit(of: SubmitTriggers.search) {
                    Task {
                        await newsHandler.fetchNews(searchText)
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

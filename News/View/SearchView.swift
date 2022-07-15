//
//  SearchView.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    @StateObject var settings = SearchSettings()
    
    @State private var searchText = ""
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ZStack {
                PlaceholderView(sfSymbolName: "magnifyingglass", message: "Nothing here yet.", hint: "Use the search field or the gear settings to look for something specific.")
                    .opacity(newsHandler.articles.isEmpty ? 1.0 : 0.0)
                ArticleList(articles: $newsHandler.articles)
            }
                .navigationTitle("News Search")
                .searchable(text: $searchText, prompt: "Search the web for ...")
                .onSubmit(of: SubmitTriggers.search) {
                    settings.searchText = searchText
                    Task {
                        await newsHandler.fetchNews(settings.searchText, in: settings.language, from: settings.dateFrom, to: settings.dateTo, sortBy: settings.sortBy)
                    }
                }
                .sheet(isPresented: $showSettings, onDismiss: {
                    guard !settings.searchText.isEmpty else { return }
                    newsHandler.articles.removeAll()
                    Task {
                        await newsHandler.fetchNews(settings.searchText, in: settings.language, from: settings.dateFrom, to: settings.dateTo, sortBy: settings.sortBy)
                    }
                }, content: {
                    SearchSetupView(settings: settings)
                })
                .refreshable {
                    Task {
                        await newsHandler.fetchNews(settings.searchText, in: settings.language, from: settings.dateFrom, to: settings.dateTo, sortBy: settings.sortBy)
                    }
                }
                .toolbar {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gear")
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(NewsHandler())
    }
}

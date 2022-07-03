//
//  SearchView.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State var news: NewsResponse? = nil
    @State var showSearchSheet = false
    
    var body: some View {
        ArticleList(articles: news?.articles)
            .sheet(isPresented: $showSearchSheet) {
                if !searchText.isEmpty {
                    Task {
                        news = await NetworkManager.shared.getNews(searchFor: searchText)
                    }
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

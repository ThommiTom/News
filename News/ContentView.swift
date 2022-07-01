//
//  ContentView.swift
//  News
//
//  Created by Thomas Schatton on 29.06.22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State var news: NewsResponse?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(news?.articles ?? [Article](), id: \.self) { artice in
                        Text(artice.title ?? "nil")
                            .font(.headline)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("News")
            .searchable(text: $searchText, prompt: "Searching for ...")
            .onChange(of: searchText) { _ in
                // TODO: use combine frame to avoid server spam!
                if !searchText.isEmpty {
                    Task {
                        await NetworkManager.shared.getNews(searchFor: searchText) { result in
                            switch result {
                            case .success(let newsResponse):
                                print("success")
                                DispatchQueue.main.async {
                                    news = newsResponse
                                }
                            case .failure(let error):
                                print(error.rawValue)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

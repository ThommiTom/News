//
//  ContentView.swift
//  News
//
//  Created by Thomas Schatton on 29.06.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showSafari = false
    @State private var searchText = ""
    @State private var stringURL: String = ""
    @State private var url: URL?
    
    @State var news: NewsResponse?
    
    @State private var error: NetworkError?
    
    var body: some View {
        NavigationView {
            VStack {
                
                List {
                    ForEach(news?.articles ?? [Article](), id: \.self) { artice in
                        Text(artice.title)
                            .font(.largeTitle)
                    }
                }
                .listStyle(.plain)
                
                Text("URL Construction Test")
                    .font(.title)
                    .padding()
                
                Text(stringURL)
                    .padding()
                
                
//                Button {
//                    showSafari = true
//                } label: {
//                    Text("Open in Safari")
//                }
//                .buttonStyle(.borderedProminent)
//                .disabled(searchText.isEmpty ? true : false)
                
                Button {
//                    showSafari = true
                    
                    Task{
                        print("searching for: \(searchText)")
                        await NetworkManager.shared.getNews(searchFor: searchText) { result in
                            switch result {
                            case .success(let newsResponse):
                                news = newsResponse
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                    }
                    
                } label: {
                    Text("Download")
                }
                .buttonStyle(.borderedProminent)
                .disabled(searchText.isEmpty ? true : false)
            }
            .navigationTitle("News")
            .searchable(text: $searchText, prompt: "Searching for ...")
//            .onChange(of: searchText) { _ in
//                if searchText.isEmpty {
//                    stringURL = ""
//                    url = nil
//                } else {
//                    url = URLBuilder.shared.createEverythingURL(searchFor: searchText.lowercased())
//                    stringURL = url!.absoluteString
//                }
//            }
//            .fullScreenCover(isPresented: $showSafari) {
//                if let validURL = url {
//                    SafariView(url: validURL)
//                }
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

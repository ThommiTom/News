//
//  ContentView.swift
//  News
//
//  Created by Thomas Schatton on 29.06.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var newsHandler = NewsHandler()
    @State private var selection = "headlines"
    
    var body: some View {
        TabView(selection: $selection) {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag("search")
            
            HeadlineView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Headlines")
                }
                .tag("headlines")
            
            ReadingListView()
                .tabItem {
                    Image(systemName: "eyeglasses")
                    Text("Reading List")
                }
                .tag("readingList")
        }
        .environmentObject(newsHandler)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

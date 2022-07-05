//
//  ContentView.swift
//  News
//
//  Created by Thomas Schatton on 29.06.22.
//

import SwiftUI

struct ContentView: View {
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
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "eyeglasses")
                    Text("Reading List")
                }
                .tag("readingList")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

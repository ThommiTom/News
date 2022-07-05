//
//  HeadlineView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct HeadlineView: View {
    @StateObject var newsHandler = NewsHandler()
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ArticleList(articles: $newsHandler.fetchedHeadlines)
            .navigationTitle("Headlines")
            .toolbar {
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gear")
                }
            }
            .onAppear {
                Task {
                    await NetworkManager.shared.getHeadlines(for: nil, in: Country.de)
                }
            }
            .sheet(isPresented: $showSettings) {
                Text("show editable settings here")
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView()
    }
}

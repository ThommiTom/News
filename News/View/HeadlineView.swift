//
//  HeadlineView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct HeadlineView: View {
    @EnvironmentObject var newsHandler: NewsHandler
    @StateObject var settings = UserSettings()
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ArticleList(articles: $newsHandler.headlines)
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
                    await newsHandler.fetchHeadlines(for: settings.category, in: settings.language, from: settings.dateFrom, to: settings.dateTo)
                }
            }
            .refreshable {
                Task {
                    await newsHandler.fetchHeadlines(for: settings.category, in: settings.language, from: settings.dateFrom, to: settings.dateTo)
                }
            }
            .sheet(isPresented: $showSettings, onDismiss: {
                Task {
                    await newsHandler.fetchHeadlines(for: settings.category, in: settings.language, from: settings.dateFrom, to: settings.dateTo)
                }
            }, content: {
                SetupView(settings: settings)
            })
        }
        .navigationViewStyle(.stack)
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView()
    }
}

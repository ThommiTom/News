//
//  HeadlineView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct HeadlineView: View {
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var newsHandler: NewsHandler
    @StateObject var settings = HeadlineSettings()
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            ArticleList(articles: $newsHandler.headlines)
            .navigationTitle("Todays Headlines")
            .toolbar {
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gear")
                }
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    Task {
                        await newsHandler.fetchHeadlines(for: settings.category, in: settings.language)
                    }
                }
            }
            .refreshable {
                Task {
                    await newsHandler.fetchHeadlines(for: settings.category, in: settings.language)
                }
            }
            .sheet(isPresented: $showSettings, onDismiss: {
                newsHandler.headlines.removeAll()
                Task {
                    await newsHandler.fetchHeadlines(for: settings.category, in: settings.language)
                    
                }
            }, content: {
                HeadlineSetupView(settings: settings)
            })
        }
        .navigationViewStyle(.stack)
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView()
            .environmentObject(NewsHandler())
    }
}

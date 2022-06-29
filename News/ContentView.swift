//
//  ContentView.swift
//  News
//
//  Created by Thomas Schatton on 29.06.22.
//

import SwiftUI

struct ContentView: View {
    @State private var showSafari = false
    
    @State private var websites: [URL] = [
        URL(string: "https://www.google.de")!,
        URL(string: "https://www.apple.com/de/")!,
        URL(string: "https://de.wikipedia.org/wiki/Wikipedia:Hauptseite")!,
        URL(string: "https://www.reddit.com")!,
        URL(string: "https://github.com")!,
        URL(string: "https://developer.apple.com/documentation/technologies")!,
        URL(string: "https://www.hackingwithswift.com")!
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(websites, id: \.self) { website in
                    NavigationLink {
                        SFSafariViewWrapper(url: website)
                    } label: {
                        Text("\(website.absoluteString)")
                    }
                }
            }
            .navigationTitle("Websites")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

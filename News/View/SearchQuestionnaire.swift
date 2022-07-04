//
//  SearchQuestionnaire.swift
//  News
//
//  Created by Thomas Schatton on 03.07.22.
//

import SwiftUI

struct SearchQuestionnaire: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            Text("What are you looking for?")
                .font(.title)
                .opacity(0.9)
            
            TextField("Searching for...", text: $searchText)
                .padding()
                .background(.ultraThinMaterial)
                .padding()

            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {}
        }
    }
}

struct SearchQuestionnaire_Previews: PreviewProvider {
    static var previews: some View {
        SearchQuestionnaire(searchText: Binding<String>.constant("Telsa"))
    }
}

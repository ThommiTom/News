//
//  EmptyReadingListView.swift
//  News
//
//  Created by Thomas Schatton on 15.07.22.
//

import SwiftUI

struct EmptyReadingListView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "eyeglasses")
                .resizable()
                .scaledToFit()
                .scaleEffect(0.3)
                .frame(maxHeight: 100)
                .padding(.horizontal)
                .opacity(0.5)
            
            Text("Currently your reading list is empty.")
                .font(.headline)
                .opacity(0.7)
                .padding()
            
            Text("You can add articles from headline or search tab by using swipe gestures.")
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(0.5)
                .padding(.horizontal, 30)
        }
    }
}

struct EmptyReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyReadingListView()
    }
}

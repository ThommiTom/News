//
//  EmptyReadingListView.swift
//  News
//
//  Created by Thomas Schatton on 15.07.22.
//

import SwiftUI

struct PlaceholderView: View {
    var sfSymbolName: String
    var message: String
    var hint: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: sfSymbolName)
                .resizable()
                .scaledToFit()
                .scaleEffect(0.3)
                .frame(maxHeight: 100)
                .padding(.horizontal)
                .opacity(0.5)
            
            Text(message)
                .font(.headline)
                .opacity(0.7)
                .padding()
            
            Text(hint)
                .font(.callout)
                .multilineTextAlignment(.center)
                .opacity(0.5)
                .padding(.horizontal, 30)
        }
    }
}

struct EmptyReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView(sfSymbolName: "eyeglasses", message: "Currently your reading list is empty", hint: "Add articles to your reading list by using swipe gestures in the Headline or Search tab.")
    }
}

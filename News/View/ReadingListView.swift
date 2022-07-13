//
//  FavoriteView.swift
//  News
//
//  Created by Thomas Schatton on 04.07.22.
//

import SwiftUI

struct ReadingListView: View {
    var body: some View {
        NavigationView {
            CompactArticleView()
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}

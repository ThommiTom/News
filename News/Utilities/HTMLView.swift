//
//  HTMLView.swift
//  News
//
//  Created by Thomas Schatton on 24.07.22.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    var HTMLstring: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(HTMLstring, baseURL: nil)
    }
}

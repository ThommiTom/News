//
//  ArticleDetailsView.swift
//  News
//
//  Created by Thomas Schatton on 08.07.22.
//

import SwiftUI

struct ArticleDetailsView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var article: Article
    
    @State private var showInSafari = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Button {
                dismiss()
            } label: {
                Label {
                    Text("Headlines")
                } icon: {
                    Image(systemName: "chevron.left")
                }

            }
            .padding(.bottom, 10)
            
            ArticleHeaderView(article: $article, showHeadline: true)
            
            if let urlToImage = article.urlToImage {
                HStack {
                    Spacer()
                    
                    VStack {
                        AsyncImage(url: URL(string: urlToImage)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                                .padding()
                        }
                        
                        if let author = article.author {
                            Text(" written by \(author)")
                                .font(.caption)
                                .opacity(0.7)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            
            if let description = article.description {
                if description.isValidHTML() {
                    HTMLView(HTMLstring: description)
                } else {
                    Text(description)
                        .opacity(0.9)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
                .frame(maxWidth : .infinity, maxHeight: 5)
            
            if let articleBody = article.content {
                if articleBody.isValidHTML() {
                    HTMLView(HTMLstring: articleBody)
                } else {
                    Text(articleBody)
                        .opacity(0.9)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button {
                   showInSafari = true
                } label: {
                    Label {
                        Text("Show in Safari")
                    } icon: {
                        Image(systemName: "safari")
                    }
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showInSafari) {
            if let stringURL = article.url {
                SafariView(url: URL(string: stringURL)!)
            }
        }
        .padding()
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: Binding<Article>.constant(Article.htmlExample))
    }
}

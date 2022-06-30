//
//  NetworkManager.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURLString = "https://newsapi.org/v2/"
}

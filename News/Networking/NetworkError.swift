//
//  NetworkError.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

import Foundation

enum NetworkError: String, Error {
    case unknownError = "An unknown error occured."
    case unableToComplete = "Unable to complete request - check internet connection."
    case invalidResponse = "Invalid server response"
    case invalidStatusCode = "Invalid status code"
    case invalidData = "Invalid data"
    case invalidURL = "Invalid URL"
}

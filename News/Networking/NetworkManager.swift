//
//  NetworkManager.swift
//  News
//
//  Created by Thomas Schatton on 30.06.22.
//

// TESTING GIT SETTING FOR CONTRIBUTION GRAPH

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    private func networkCall(with url: URL, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) async {
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(apiKey, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            // handle possible error
            guard error == nil else {
                print(NetworkError.unableToComplete.localizedDescription)
                completion(.failure(.unableToComplete))
                return
            }
            
            // check url response
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                print(NetworkError.invalidResponse.localizedDescription)
                completion(.failure(.invalidResponse))
                return
            }
            
            // check http response status code
            guard (200...299).contains(httpResponse.statusCode) else {
                print("StatusCode: \(httpResponse.statusCode)")
                print(NetworkError.invalidStatusCode.localizedDescription)
                completion(.failure(.invalidStatusCode))
                return
            }
            
            // check data availability
            guard let validData = data else {
                print(NetworkError.invalidData.localizedDescription)
                completion(.failure(.invalidData))
                return
            }
            
            // parse data into model
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let newsResponse = try decoder.decode(NewsResponse.self, from: validData)
                completion(.success(newsResponse))
            } catch {
                print(NetworkError.unableToDecodeData.localizedDescription)
                completion(.failure(.unableToDecodeData))
            }
        }.resume()
    }
    
    func getNews(searchFor q: String, in language: Language, from: String?, to: String?, sortBy: SortBy, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) async {
        let url = URLBuilder.shared.createEverythingURL(searchFor: q, in: language, from: from, to: to, sortBy: sortBy)
        await networkCall(with: url, completion: completion)
    }
    
    func getHeadlines(for category: Category?, in language: Language?, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) async {
        let url = URLBuilder.shared.createHeadlineURL(for: category, in: language)
        await networkCall(with: url, completion: completion)
    }
}

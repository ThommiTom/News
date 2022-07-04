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
    
    func getNews(searchFor q: String) async -> NewsResponse? {
        let url = URLBuilder.shared.createEverythingURL(searchFor: q)
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print("Data downloaded")
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            
            let decodedData = try jsonDecoder.decode(NewsResponse.self, from: data)
            return decodedData
            
        } catch let jsonError as NSError {
            print("JSON decode failed: \(jsonError.localizedDescription)")
        } catch let networkError as NetworkError {
            print("Networking failed: \(networkError.rawValue)")
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    func getNews(searchFor q: String, completion: @escaping (Result<NewsResponse, NetworkError>) -> Void) async {
        let url = URLBuilder.shared.createEverythingURL(searchFor: q)
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, urlResponse, error in
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
}

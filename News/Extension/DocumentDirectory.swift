//
//  DocumentDirectory.swift
//  News
//
//  Created by Thomas Schatton on 20.07.22.
//

import Foundation

extension FileManager {
    static var DocumentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func load<Item: Codable>(location: URL) -> Item? {
        do {
            let data = try Data(contentsOf: location)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let item = try jsonDecoder.decode(Item.self, from: data)
            return item
        } catch {
            print("ERROR - loading data from document directory failed - \(error.localizedDescription)")
        }
        return nil
    }
    
    func save<Item: Codable>(item: Item, location: URL) {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.dateEncodingStrategy = .iso8601
            let data = try jsonEncoder.encode(item)
            try data.write(to: location, options: [.atomic, .completeFileProtection])
        } catch {
            print("ERROR - saving item to document directory failed - \(error.localizedDescription)")
        }
    }
}

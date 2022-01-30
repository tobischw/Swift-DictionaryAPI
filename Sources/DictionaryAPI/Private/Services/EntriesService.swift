//
//  EntriesService.swift
//  
//
//  Created by Tobi Schweiger on 1/29/22.
//

import Foundation

struct EntriesService {
    public func getEntries(for word: String, completion: @escaping (Result<[Entry], Error>) -> ()) {
        API.makeRequest(Endpoint.getEntries(for: word),
                        method: .get,
                        completion: completion)
    }
}

private extension Endpoint {
    static func getEntries(for word: String) -> Endpoint {
        Endpoint(
            path: "/entries/en/\(word)",
            queryItems: []
        )
    }
}

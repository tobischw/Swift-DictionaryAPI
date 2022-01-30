//
//  Endpoint.swift
//
//
//  Created by Tobi Schweiger on 1/9/22.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
    
    public init(path: String, queryItems: [URLQueryItem]) {
        self.path = path
        self.queryItems = queryItems
    }
    
    public init(path: String) {
        self.init(path: path, queryItems: [])
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = ConfigurationGlobals.environment.host
        components.path = "/api/v2\(path)"
        components.queryItems = queryItems
        
        return components.url
    }
}


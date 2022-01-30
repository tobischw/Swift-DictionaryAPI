//
//  API.swift
//
//
//  Created by Tobi Schweiger on 1/9/22.
//

import Foundation

extension Environment {
    var host: String {
        switch self {
            case .production:
                return "api.dictionaryapi.dev"
        }
    }
}

enum APIError: Error {
    case invalidEndpointURL
    case unknown
}

struct API {
    private static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
    
    static func makeRequest<T: Codable>(_ endpoint: Endpoint, _ body: Data? = nil, method: Method, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = endpoint.url else {
            completion(.failure(APIError.invalidEndpointURL))
            return
        }
        
        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData
        )
        
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  error == nil
            else {
                completion(.failure(error ?? APIError.unknown))
                return
            }
            
            let result = try! Self.decoder.decode(T.self, from: data)
            print(response)
            
            completion(.success(result))
        }
        task.resume()
    }
}

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

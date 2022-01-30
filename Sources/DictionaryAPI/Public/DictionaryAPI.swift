//
//  DictionaryAPI.swift
//  
//
//  Created by Tobi Schweiger on 1/29/22.
//

import Foundation
import UIKit

class ConfigurationGlobals {
    static var environment: Environment = .production
}

public struct DictionaryAPI {
    private let entriesService: EntriesService
    
    public init(environment: Environment = .production) {
        ConfigurationGlobals.environment = environment
        
        entriesService = EntriesService()
    }
    
    public func getDefinitions(forWord word: String, completion: @escaping (Result<[Definition], Error>) -> ()) {
        entriesService.getEntries(for: word) { result in
            switch result {
                case .success(let entries):
                    completion(
                        .success(
                            entries.flatMap { $0.meanings }
                                   .flatMap { $0.definitions }
                        )
                    )
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

public enum Environment {
    case production
}

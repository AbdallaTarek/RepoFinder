//
//  ResultSuccessError.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation


extension Result where Success == (Data, HTTPURLResponse) {
    struct ResultSuccessError: Error {}
    
    @discardableResult
    func defaultMap<T: Decodable>(to type: T.Type) throws -> T {
        if case let Result.failure(error) = self {
            throw error
        }
        
        guard case let Self.success((data, httpResponse)) = self else {
            throw ResultSuccessError()
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return try JSONDecoder().decode(type, from: data)
        default:
            throw ResultSuccessError()
        }
    }
}

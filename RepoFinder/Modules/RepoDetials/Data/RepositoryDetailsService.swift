//
//  RepositoryDetailsServiceInterface.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation
import HTTPClient

protocol RepositoryDetailsServiceInterface: AnyObject {
    func fitchRepositoryCommits(fullName: String) async throws -> [CommitModel]
}

class RepositoryDetailsService: RepositoryDetailsServiceInterface {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func fitchRepositoryCommits(fullName: String) async throws -> [CommitModel] {
        let endpoint: HTTPEndPoint = RepositoryDetailsEndPoint(fullName: fullName)
        let data = try await client.perform(endpoint: endpoint)
        let dataModel = try data.defaultMap(to: [CommitModel].self)     
        return dataModel
    }
}

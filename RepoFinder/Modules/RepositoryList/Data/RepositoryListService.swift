//
//  RepositoryListService.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation
import HTTPClient

protocol RepositoryListServiceInterface {
    func fitchRepoList() async throws -> [RepositoryModel]
}

class RepositoryListService: RepositoryListServiceInterface {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func fitchRepoList() async throws -> [RepositoryModel] {
        let endPoint: HTTPEndPoint = RepositoryListEndPoint()
        return try await client.perform(endpoint: endPoint).defaultMap(to: [RepositoryModel].self)
    }
}

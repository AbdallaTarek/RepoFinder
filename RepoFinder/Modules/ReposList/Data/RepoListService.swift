//
//  RepoListService.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation
import HTTPClient

protocol ReposListServiceInterface {
    func fitchRepoList() async throws -> [ReposListModel]
}

class ReposListService: ReposListServiceInterface {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func fitchRepoList() async throws -> [ReposListModel] {
        let endPoint: HTTPEndPoint = RepoListEndPoint()
        return try await client.perform(endpoint: endPoint).defaultMap(to: [ReposListModel].self)
    }
}

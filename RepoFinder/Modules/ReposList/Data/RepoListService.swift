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
    private let clint: HTTPClient

    init(clint: HTTPClient) {
        self.clint = clint
    }

    func fitchRepoList() async throws -> [ReposListModel] {
        let endPoint: HTTPEndPoint = RepoListEndPoint()
        return try await clint.perform(endpoint: endPoint).defaultMap(to: [ReposListModel].self)
    }
}

//
//  ReposListRepository.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

protocol ReposListRepositoryInterface {
    func fitchApiGithubRepos() async throws -> [ReposListModel]
}



class ReposListRepository: ReposListRepositoryInterface {
    private let service: ReposListServiceInterface
    
    init(service: ReposListServiceInterface) {
        self.service = service
    }

    func fitchApiGithubRepos() async throws -> [ReposListModel] {
        return try await service.fitchRepoList()
    }
}

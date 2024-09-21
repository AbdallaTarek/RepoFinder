//
//  RepositoryListRepository.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

protocol RepositoryListRepositoryInterface {
    func fitchApiGithubRepos() async throws -> [RepositoryModel]
}



class RepositoryListRepository: RepositoryListRepositoryInterface {
    private let service: RepositoryListServiceInterface
    
    init(service: RepositoryListServiceInterface) {
        self.service = service
    }

    func fitchApiGithubRepos() async throws -> [RepositoryModel] {
        return try await service.fitchRepoList()
    }
}

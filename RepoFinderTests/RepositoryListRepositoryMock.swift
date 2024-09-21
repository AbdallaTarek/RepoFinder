//
//  RepositoryListRepositoryMock.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

@testable import RepoFinder

class RepositoryListRepositoryMock: RepositoryListServiceInterface {
    func fitchRepoList() async throws -> [RepositoryModel] {
        return RepositoryModel.dummyData()
    }
}

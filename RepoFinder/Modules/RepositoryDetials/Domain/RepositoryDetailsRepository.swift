//
//  RepositoryDetailsRepository.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

protocol RepositoryDetailsRepositoryInterface {
    func fitchRepositoryCommits(fullName: String) async throws -> [CommitModel]
}

class RepositoryDetailsRepository: RepositoryDetailsRepositoryInterface {
    private let service: RepositoryDetailsServiceInterface

    init(service: RepositoryDetailsServiceInterface) {
        self.service = service
    }

    func fitchRepositoryCommits(fullName: String) async throws -> [CommitModel] {
        try await service.fitchRepositoryCommits(fullName: fullName)
    }
}

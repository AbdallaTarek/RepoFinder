//
//  ReposListUserCase.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

protocol ReposListUserCaseInterface {
    func getGithubRepos() async throws -> [ReposListResponse]
    func getItemsCount() -> Int
}

final class ReposListUserCase: ReposListUserCaseInterface {
    private var reposListDataSource: [ReposListResponse]?
    private let repository = ReposListRepository()

    public init() { }

    func getGithubRepos() async throws -> [ReposListResponse] {
        do {
            reposListDataSource = try await repository.fitchApiGithubRepos()
            return reposListDataSource ?? []
        } catch {
            throw error
        }
    }

    func getItemsCount() -> Int {
        return reposListDataSource?.count ?? 0
    }
}

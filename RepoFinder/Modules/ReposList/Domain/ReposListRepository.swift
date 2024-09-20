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
    init() {}

    func fitchApiGithubRepos() async throws -> [ReposListModel] {
        return [
            ReposListModel(
                id: 0,
                name: "Hello World",
                fullName: "Abduallah Tarek",
                owner: OwnerModel(
                    id: 0,
                    login: "AbdallaTarek",
                    avatarURL: URL(string: "https://media.licdn.com/dms/image/v2/D4D03AQHgSGWExLHErA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1721952431761?e=1732147200&v=beta&t=IOqiNdGUhRBRN6d2ARjKrRO4RWpWs48vQjR1ZevIpHE")!
                ),
                htmlURL: URL(string: "https://example.com")!,
                description: "Hello world repo",
                createdAt: Date()
            ),
            ReposListModel(
                id: 1,
                name: "Hello World_2",
                fullName: "Abduallah Tarek2",
                owner: OwnerModel(
                    id: 1,
                    login: "AbdallaTarek2",
                    avatarURL: URL(string: "https://media.licdn.com/dms/image/v2/D4D03AQHgSGWExLHErA/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1721952431761?e=1732147200&v=beta&t=IOqiNdGUhRBRN6d2ARjKrRO4RWpWs48vQjR1ZevIpHE")!
                ),
                htmlURL: URL(string: "https://example.com")!,
                description: "Hello world repo",
                createdAt: Date()
            ),
        ]
    }
}

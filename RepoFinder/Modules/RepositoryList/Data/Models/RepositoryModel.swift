//
//  RepositoryModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

struct RepositoryModel: Codable {
    let id: Int?
    let name: String?
    let fullName: String?
    let owner: OwnerModel
    let htmlURL: URL?
    let description: String?
    let createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id, name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case description
        case createdAt = "created_at"
    }
    
    
    static func dummyData() -> [Self] {
        [
            .init(
                id: 0,
                name: "Abdullah",
                fullName: "Abdullah Tarek",
                owner: OwnerModel(id: 0, login: "Abdullah", avatarURL: URL(string: "")),
                htmlURL: URL(string: "https://github.com"),
                description: "This is a sample description.",
                createdAt: .randomDate()
            ),
            .init(
                id: 2,
                name: "Abdullah",
                fullName: "Abdullah Tarek",
                owner: OwnerModel(id: 40, login: "Abdullah", avatarURL: URL(string: "")),
                htmlURL: URL(string: "https://github.com"),
                description: "This is a sample description.",
                createdAt: .randomDate()
            ),
            .init(
                id: 4,
                name: "Abdullah",
                fullName: "Abdullah Tarek",
                owner: OwnerModel(id: 2, login: "Abdullah", avatarURL: URL(string: "")),
                htmlURL: URL(string: "https://github.com"),
                description: "This is a sample description.",
                createdAt: .randomDate()
            )
        ]
    }
}

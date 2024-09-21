//
//  CommitData.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

struct CommitData: Codable {
    let committer: CommitAuthor?
    let message: String?
    let url: String?
    let commentCount: Int?

    enum CodingKeys: String, CodingKey {
        case committer, message, url
        case commentCount = "comment_count"
    }
}

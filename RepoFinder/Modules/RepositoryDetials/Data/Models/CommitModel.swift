//
//  WelcomeElement.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import Foundation

struct CommitModel: Codable {
    let sha: String?
    let commit: CommitData?
    let htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case sha
        case commit
        case htmlURL = "html_url"
    }
}

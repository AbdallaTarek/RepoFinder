//
//  CommitData.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//


import Foundation

struct CommitDataEntity: Identifiable {
    var id = UUID()
    let committer: CommitAuthorEntity?
    let message: String
    let url: String
    let commentCount: Int
}

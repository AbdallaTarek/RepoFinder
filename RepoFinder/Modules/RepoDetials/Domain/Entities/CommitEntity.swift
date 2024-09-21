//
//  CommitModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//


import Foundation

struct CommitEntity: Identifiable {
    let id = UUID()
    let sha: String
    let commit: CommitDataEntity?
    let htmlURL: String
}

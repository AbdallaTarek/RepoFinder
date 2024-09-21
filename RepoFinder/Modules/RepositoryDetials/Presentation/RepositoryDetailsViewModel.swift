//
//  RepositoryDetailsViewModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import Foundation

@MainActor
protocol RepositoryDetailsViewModelInterface: ObservableObject {
    var commitsDataSource: [CommitEntity] { get set }
    var repositoryData: RepositoryListEntity { get set }
    func fetchCommitsList()
}

@MainActor
class RepositoryDetailsViewModel: RepositoryDetailsViewModelInterface {
    @Published var commitsDataSource: [CommitEntity] = []
    @Published var repositoryData: RepositoryListEntity
    
    let useCase: RepositoryDetailsUserCaseInterface

    init(repositoryData: RepositoryListEntity, useCase: RepositoryDetailsUserCaseInterface) {
        self.repositoryData = repositoryData
        self.useCase = useCase
    }

    func fetchCommitsList() {
        Task {
            do {
                commitsDataSource = try await useCase.getRepositoryCommits()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

//
//  RepositoryListViewModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

@MainActor
protocol RepositoryListViewModelInterface: ObservableObject {
    var reposListDataSource: [RepositoryListEntity] { get set }
    func fetchReposList()
}

@MainActor
class RepositoryListViewModel: RepositoryListViewModelInterface {
    @Published var reposListDataSource: [RepositoryListEntity] = []
    
    let useCase: RepositoryListUserCaseInterface

    init(useCase: RepositoryListUserCaseInterface) {
        self.useCase = useCase
    }

    func fetchReposList() {
        Task {
            reposListDataSource = try await useCase.getGithubRepos()
        }
    }
}

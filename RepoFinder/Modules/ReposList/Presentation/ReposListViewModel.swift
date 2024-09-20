//
//  ReposListViewModel.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 19/09/2024.
//

import Foundation

@MainActor
protocol ReposListViewModelInterface: ObservableObject {
    var reposListDataSource: [ReposListEntity] { get set }
    func fetchReposList()
}

@MainActor
class ReposListViewModel: ReposListViewModelInterface {
    @Published var reposListDataSource: [ReposListEntity] = []
    let useCase: ReposListUserCaseInterface

    init(useCase: ReposListUserCaseInterface) {
        self.useCase = useCase
    }

    func fetchReposList() {
        Task {
            reposListDataSource = try await useCase.getGithubRepos()
        }
    }
}

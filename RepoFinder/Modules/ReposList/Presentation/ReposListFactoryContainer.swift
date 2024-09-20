//
//  ReposListFactoryContainer.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI

struct ReposListFactoryContainer {
    static func repositry() -> ReposListRepositoryInterface {
        return ReposListRepository()
    }

    static func useCase() -> ReposListUserCaseInterface {
        let repository = Self.repositry()
        return ReposListUserCase(repository: repository)
    }

    @MainActor static func viewModel() -> ReposListViewModel {
        let useCase = Self.useCase()
        return ReposListViewModel(useCase: useCase)
    }

    @MainActor static func view() -> AnyView {
        let viewModel = Self.viewModel()
        return AnyView(ReposListView(viewModel: viewModel))
    }
}

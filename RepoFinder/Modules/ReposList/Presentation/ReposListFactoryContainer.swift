//
//  ReposListFactoryContainer.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI
import URLSessionHTTPClient

struct ReposListFactoryContainer {
    
    static func service() -> ReposListServiceInterface {
        let clint = URLSessionHTTPClient()
        return ReposListService(clint: clint)
    }
    
    static func repositry() -> ReposListRepositoryInterface {
        return ReposListRepository(service: Self.service())
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

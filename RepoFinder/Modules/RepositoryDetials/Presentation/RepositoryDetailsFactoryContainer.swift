//
//  RepositoryDetailsFactoryContainer.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import SwiftUI
import URLSessionHTTPClient

struct RepositoryDetailsFactoryContainer {
    static func service() -> RepositoryDetailsServiceInterface {
        let client = URLSessionHTTPClient()
        return RepositoryDetailsService(client: client)
    }

    static func repository() -> RepositoryDetailsRepositoryInterface {
        return RepositoryDetailsRepository(service: Self.service())
    }

    static func useCase(fullName: String) -> RepositoryDetailsUserCaseInterface {
        return RepositoryDetailsUserCase(repository: Self.repository(), fullName: fullName)
    }

    @MainActor static func viewModel(repositoryData: RepositoryListEntity) -> RepositoryDetailsViewModel {
        let useCase = Self.useCase(fullName: repositoryData.fullName)
        return RepositoryDetailsViewModel(repositoryData: repositoryData, useCase: useCase)
    }

    @MainActor static func view(repositoryData: RepositoryListEntity) -> AnyView {
        let viewModel = Self.viewModel(repositoryData: repositoryData)
        return AnyView(RepositoryDetailsView(viewModel: viewModel))
    }
    
    @MainActor static func previewView() -> AnyView {
        let repositoryListEntity = RepositoryListEntity.dummyData(owner: OwnerEntity.dummyData())
        return Self.view(repositoryData: repositoryListEntity)
    }
}

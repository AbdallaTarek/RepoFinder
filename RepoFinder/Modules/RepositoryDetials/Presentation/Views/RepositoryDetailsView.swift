//
//  RepositoryDetailsView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI

struct RepositoryDetailsView<ViewModel: RepositoryDetailsViewModelInterface>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List {
            Section {
                RepositoryDetailsHeaderView(repositoryData: viewModel.repositoryData, commitsCount: viewModel.commitsDataSource.count)
            }

            if !viewModel.commitsDataSource.isEmpty {
                Section("Last commits:") {
                    commitListSection(commitEntity: viewModel.commitsDataSource)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchCommitsList()
        }
    }

    private func commitListSection(commitEntity: [CommitEntity]) -> some View {
        ForEach(commitEntity) { commitEntity in
            CommitView(commitEntity: commitEntity)
        }
    }
}

#Preview {
    RepositoryDetailsFactoryContainer.previewView()
}

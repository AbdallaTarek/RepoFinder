//
//  RepositoryDetailsView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 20/09/2024.
//

import SwiftUI

struct RepositoryDetailsView: View {
    var repositoryData: ReposListEntity

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                repositoryTitleSection
                ownerInfoSection
                Divider()
                descriptionSection
                statisticsSection
                Divider()
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var repositoryTitleSection: some View {
        Text(repositoryData.fullName)
            .font(.largeTitle)
            .fontWeight(.bold)
    }

    private var ownerInfoSection: some View {
        HStack {
            ownerAvatar
            ownerDetails
            Spacer()
        }
    }

    private var ownerAvatar: some View {
        AsyncImage(url: repositoryData.owner.avatar) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 80, height: 80)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private var ownerDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Owner: \(repositoryData.owner.login)")
                .font(.headline)
            Text("Created on \(repositoryData.createdAt)")
                .font(.footnote)
                .foregroundColor(.gray)
            if let htmlURL = repositoryData.htmlURL {
                Link("View on GitHub", destination: htmlURL)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
    }

    private var descriptionSection: some View {
        Text(repositoryData.description)
            .font(.body)
            .padding(.bottom, 10)
    }

    private var statisticsSection: some View {
        HStack(alignment: .center) {
            statisticView(icon: "★", label: "Stars", value: "1.5k")
            statisticView(icon: "🍴", label: "Forks", value: "300")
            statisticView(icon: "🐛", label: "Issues", value: "42")
        }
        .padding(.vertical)
    }

    private func statisticView(icon: String, label: String, value: String) -> some View {
        VStack(alignment: .center) {
            Text(icon)
                .font(.largeTitle)
                .padding(.bottom, 4)
            Text(label)
                .font(.subheadline)
            Text(value)
                .font(.headline)
        }
    }
}

#Preview {
    RepositoryDetailsView(repositoryData: ReposListEntity(repoId: 0, name: "Abdullah", fullName: "Abdullah Tarek", owner: OwnerEntity(ownerId: 0, login: "axxxxs", avatar: URL(string: "https://avatars.githubusercontent.com/u/1?v=4")), htmlURL: URL(string: "https://github.com"), description: "This is a sample description.", createdAt: "2024"))
}

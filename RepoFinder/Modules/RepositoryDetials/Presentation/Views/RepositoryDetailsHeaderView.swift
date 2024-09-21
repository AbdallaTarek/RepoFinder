//
//  RepositoryDetailsHeaderView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import SwiftUI

struct RepositoryDetailsHeaderView: View {
    var repositoryData: RepositoryListEntity
    var commitsCount: Int

    var body: some View {
        VStack(spacing: 16) {
            repositoryTitleSection
            ownerInfoSection
            descriptionSection
                .frame(maxWidth: .infinity, alignment: .leading)
            statisticsSection
        }
    }

    private var repositoryTitleSection: some View {
        Text(repositoryData.fullName)
            .font(.title)
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
        Text(try! AttributedString(markdown: repositoryData.description))
            .font(.body)
            .padding(.bottom, 10)
    }

    private var statisticsSection: some View {
        HStack(alignment: .center) {
            statisticView(icon: "★", label: "Stars", value: "1.5k")
            statisticView(icon: "🍴", label: "Forks", value: "300")
            statisticView(icon: "🐛", label: "Issues", value: "42")
            statisticView(icon: "🎉", label: "Commits", value: "\(commitsCount)")
        }
        .padding(.vertical)
    }

    private func statisticView(icon: String, label: String, value: String) -> some View {
        VStack(alignment: .center) {
            Text(icon)
                .font(.title)
                .padding(.bottom, 4)
            Text(label)
                .font(.subheadline)
            Text(value)
                .font(.headline)
        }
    }
}

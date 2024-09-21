//
//  CommitView.swift
//  RepoFinder
//
//  Created by Abdullah Tarek on 21/09/2024.
//

import SwiftUI

struct CommitView: View {
    let commitEntity: CommitEntity

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let commit = commitEntity.commit,
               let committer = commit.committer {
                Text("**By:** \(committer.name)")

                Text("**Email:** \(committer.email)")

                Text("**Message:**")

                Text(try! AttributedString(markdown: commit.message))
                    .multilineTextAlignment(.leading)

                Text("**On date:** \(committer.date)")
                    .foregroundColor(.gray)
                
                if let htmlURL = URL(string: commitEntity.htmlURL) {
                    Link("View commit on GitHub", destination: htmlURL)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
        }
        .font(.system(size: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
        
        .padding(.vertical,4)
    }
}

#Preview {
    CommitView(commitEntity: CommitEntity(sha: "ddddd", commit: .init(committer: .init(name: "Abdullah Tarek", email: "abdullah.tarek@paysky.io", date: ""), message: "no message to view", url: "google.com", commentCount: 2), htmlURL: "google.com"))
}

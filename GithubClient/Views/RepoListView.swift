//
//  ContentView.swift
//  GithubClient
//
//  Created by Masayuki WATANABE on 2021/07/31.
// ]

import SwiftUI

struct RepoListView: View {
    @State private var mockRepos: [Repo] = []
    
    var body: some View {

        NavigationView {
            // 読み込む前、データ配列mockRepos が殻ならプログレス表示
            if mockRepos.isEmpty {
                ProgressView("loading ... ")
            } else {
                List(mockRepos) { repo in
                    NavigationLink(
                        destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                    .navigationTitle("Repositories")    // タイトル
                }
            }
        }
        .onAppear{
            loadRepos()
        }
    }
    private func loadRepos() {
        // 1秒後にモックデータを読み込む
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            mockRepos = [
                .mock1, .mock2, .mock3, .mock4, .mock5
            ]
        }
    }

}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
    




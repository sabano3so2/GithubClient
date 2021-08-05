//
//  ContentView.swift
//  GithubClient
//
//  Created by Masayuki WATANABE on 2021/07/31.
// ２−2 URLSessiton 8/5 MaSa

import SwiftUI
import Combine

class ReposLoader : ObservableObject {
    @Published private(set) var repos = [Repo]()
    
    private var cancellables = Set<AnyCancellable>()
    
    func call() {
        
        let url = URL(string: "https://api.github.com/orgs/mixigroup/repos")!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Accept":
            "application/vnd.github.v3+json"
        ]

        let reposPublisher = URLSession.shared.dataTaskPublisher(for: urlRequest)   //URLSession がシングルトン
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
                
            }
            .decode(type: [Repo].self, decoder: JSONDecoder())
        
        reposPublisher
            .receive(on: DispatchQueue.main)        // チャレンジ
            .sink(receiveCompletion: { completion in
                print("Finished: \(completion)")
            }, receiveValue: { [weak self] repos in
                self?.repos = repos
            }
            ).store(in: &cancellables)
    }
}

struct RepoListView: View {
    @StateObject private var reposLoader = ReposLoader()
    
    private var cancellables = Set<AnyCancellable>()
        
    var body: some View {

        NavigationView {
            // 読み込む前、データ配列mockRepos が殻ならプログレス表示
            if reposLoader.repos.isEmpty {
                ProgressView("loading ... ")
            } else {
                List(reposLoader.repos) { repo in
                    NavigationLink(
                        destination: RepoDetailView(repo: repo)) {
                        RepoRow(repo: repo)
                    }
                    .navigationTitle("Repositories")    // タイトル
                }
            }
        }
        .onAppear{
            reposLoader.call()
        }
    }
}

struct RepoListView_Previews: PreviewProvider {
    static var previews: some View {
        RepoListView()
    }
}
    




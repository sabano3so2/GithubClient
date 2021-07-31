//
//  ContentView.swift
//  GithubClient
//
//  Created by Masayuki WATANABE on 2021/07/31.
// ]

import SwiftUI

struct ContentView: View {
    //    typealias Body = <#type#>
    private let mockRepos = [
            Repo(
                id: 1,
                name: "Test Repo1",
                owner: User(name: "Test User1")
            ),
            Repo(
                id: 2,
                name: "Test Repo2",
                owner: User(name: "Test User2")
            ),
            Repo(
                id: 3,
                name: "Test Repo3",
                owner: User(name: "Test User3")
            ),
            Repo(
                id: 4,
                name: "Test Repo4",
                owner: User(name: "Test User4")
            ),
            Repo(
                id: 5,
                name: "Test Repo5",
                owner: User(name: "Test User5")
            )
    ]
    
    var body: some View {
        
        List(mockRepos) { repo in
            RepoRow(repo: repo)     // masayuki Extract Subvieww で切り出した
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





//
//  RepoRepositories.swift
//  GithubClient
//
//  Created by Masayuki WATANABE on 2021/08/09.
// 3-1 MVVM

import Foundation
import Combine

struct RepoRepository {
    func fetchRepos() -> AnyPublisher<[Repo], Error> {
        RepoAPIClient().getRepos()
    }
}

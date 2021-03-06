//
//  RepoRow.swift
//  GithubClient
//
//  Created by Masayuki WATANABE on 2021/08/01.
//

import SwiftUI

// 切り出したもの（チャレンジ）
struct RepoRow: View {
    let repo: Repo  // イニシャライズの定義が必要（masayuki)
    
    var body: some View {
        HStack {
            Image("GitHubMark")
                .resizable()
                .frame(
                    width: 44.0,
                    height: 44.0
                )
            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    .font(.caption)
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        
        RepoRow(repo: .mock1)
        
    }
}

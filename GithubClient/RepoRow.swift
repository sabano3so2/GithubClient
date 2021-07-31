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
                .frame(width: 44.0, height: 44.0)
            VStack(alignment: .leading) {
                Text(repo.owner.name)
                    
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
                Text(repo.name)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
            }
            
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        
        RepoRow(repo: Repo(
            id: 1,
            name: "Test Repo1",
            owner: User(name:"Test User1")
        ))
        
    }
}

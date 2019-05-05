//
//  HomeGitStarsWorker.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

protocol HomeGitStarsWorkerProtocol {
    func getRepos(page: Int, _ completionHandler: @escaping(HomeGitStars.Repos.Response) -> Void)
}

class HomeGitStarsWorker: HomeGitStarsWorkerProtocol {
    func getRepos(page: Int, _ completionHandler: @escaping(HomeGitStars.Repos.Response) -> Void) {
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars&page=\(page)")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let httpResponse = response as? HTTPURLResponse else {
                completionHandler(HomeGitStars.Repos.Response(error: NSError(domain: "", code: 400, userInfo: nil), repositories: nil))
                return
            }
            if httpResponse.statusCode == 200 {
                do{
                    let repositories = try JSONDecoder().decode(Items.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(HomeGitStars.Repos.Response(error: nil, repositories: repositories.items))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completionHandler(HomeGitStars.Repos.Response(error: NSError(domain: "", code: 400, userInfo: nil), repositories: nil))
                    }
                }
            }
            }.resume()
    }
}

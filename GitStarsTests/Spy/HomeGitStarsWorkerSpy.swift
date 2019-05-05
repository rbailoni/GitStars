//
//  HomeGitStarsWorkerSpy.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import Foundation

class HomeGitStarsWorkerSpy: HomeGitStarsWorkerProtocol {
    var getReposCalled = false
    
    func getRepos(page: Int, _ completionHandler: @escaping (HomeGitStars.Repos.Response) -> Void) {
        getReposCalled = true
        let response = HomeGitStars.Repos.Response(error: nil, repositories: [Seeds.Repositories.validRepository, Seeds.Repositories.validRepository2])
        completionHandler(response)
    }
}

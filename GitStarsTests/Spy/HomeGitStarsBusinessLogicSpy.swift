//
//  HomeGitStarsBusinessLogicSpy.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import Foundation

class HomeGitStarsBusinessLogicSpy: HomeGitStarsBusinessLogic {
    var getReposCalled = false
    
    func getRepos(request: HomeGitStars.Repos.Request) {
        getReposCalled = true
    }
}

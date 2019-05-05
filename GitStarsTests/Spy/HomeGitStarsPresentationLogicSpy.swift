//
//  HomeGitStarsPresentationLogicSpy.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import Foundation

class HomeGitStarsPresentationLogicSpy: HomeGitStarsPresentationLogic {
    var presentRepositoriesCalled = false
    
    func presentRepositories(response: HomeGitStars.Repos.Response, isReload: Bool) {
        presentRepositoriesCalled = true
    }
}

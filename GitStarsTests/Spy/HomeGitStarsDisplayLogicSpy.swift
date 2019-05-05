//
//  HomeGitStarsDisplayLogicSpy.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import Foundation

class HomeGitStarsDisplayLogicSpy: HomeGitStarsDisplayLogic {
    var displayErrorCalled = false
    var displayReposCalled = false
    
    func displayError(erro: Error) {
        displayErrorCalled = true
    }
    
    func displayRepos(viewModel: [HomeGitStars.Repos.ViewModel]) {
        displayReposCalled = true
    }
}

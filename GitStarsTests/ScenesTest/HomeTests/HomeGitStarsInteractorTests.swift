//
//  HomeGitStarsInteractorTests.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import XCTest

class HomeGitStarsInteractorTests: XCTestCase {
    var sut: HomeGitStarsInteractor!
    
    override func setUp() {
        super.setUp()
        setupHomeGitStarsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupHomeGitStarsInteractor() {
        sut = HomeGitStarsInteractor()
    }
    
    func testGetReposShouldCallPresenter() {
        let homeGitStarsPresentationLogicSpy = HomeGitStarsPresentationLogicSpy()
        sut.presenter = homeGitStarsPresentationLogicSpy
        let homeGitStasWorkerSpy = HomeGitStarsWorkerSpy()
        sut.worker = homeGitStasWorkerSpy
        
        let request = HomeGitStars.Repos.Request(page: nil, isReload: nil)
        sut.getRepos(request: request)
        
        XCTAssertTrue(homeGitStarsPresentationLogicSpy.presentRepositoriesCalled, "getRepos() should call presentRepositories")
    }
    
    func testGetReposShouldCallWorker() {
        let homeGitStarsPresentationLogicSpy = HomeGitStarsPresentationLogicSpy()
        sut.presenter = homeGitStarsPresentationLogicSpy
        let homeGitStarsWorkerSpy = HomeGitStarsWorkerSpy()
        sut.worker = homeGitStarsWorkerSpy
        
        let request = HomeGitStars.Repos.Request(page: nil, isReload: nil)
        sut.getRepos(request: request)
        
        XCTAssertTrue(homeGitStarsWorkerSpy.getReposCalled, "getRepos() should call getRepos")
    }
}

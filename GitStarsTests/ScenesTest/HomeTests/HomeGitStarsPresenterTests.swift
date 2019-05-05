//
//  HomeGitStarsPresenterTests.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import XCTest

class HomeGitStarsPresenterTests: XCTestCase {
    
    var sut: HomeGitStarsPresenter!
    
    override func setUp() {
        super.setUp()
        setupHomeGitStarsPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupHomeGitStarsPresenter() {
        sut = HomeGitStarsPresenter()
    }
    
    func testPresentRepositoriesDisplayErrorWhenResponseErrorTrue() {
        let spy = HomeGitStarsDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeGitStars.Repos.Response(error: NSError(domain: "", code: 400, userInfo: nil), repositories: nil)
        
        sut.presentRepositories(response: response, isReload: false)
        
        XCTAssertTrue(spy.displayErrorCalled, "presentRepository(response:) should display error")
    }
    
    func testPresentRepositoriesDisplayErrorWhenRepositoriesIsNil() {
        let spy = HomeGitStarsDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeGitStars.Repos.Response(error: nil, repositories: nil)
        
        sut.presentRepositories(response: response, isReload: false)
        
        XCTAssertTrue(spy.displayErrorCalled, "presentRepository(response:) should display error")
    }
    
    func testPresentRepositoriesDisplayReposWhenResponseErrorFalseAndRepositoriesNotNil() {
        let spy = HomeGitStarsDisplayLogicSpy()
        sut.viewController = spy
        let response = HomeGitStars.Repos.Response(error: nil, repositories: [Seeds.Repositories.validRepository])
        
        sut.presentRepositories(response: response, isReload: false)
        
        XCTAssertTrue(spy.displayReposCalled, "presentRepository(response:) should display repos")
    }
}

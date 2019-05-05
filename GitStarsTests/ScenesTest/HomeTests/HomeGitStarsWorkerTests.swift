//
//  HomeGitStarsWorkerTests.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import XCTest

class HomeGitStarsWorkerTests: XCTestCase {
    var sut: HomeGitStarsWorkerProtocol!
    static var repositories: [Repository]!
    
    override func setUp() {
        super.setUp()
        setupHomeGitStarsWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func setupHomeGitStarsWorker() {
        sut = HomeGitStarsWorkerSpy()
        HomeGitStarsWorkerTests.repositories = [Seeds.Repositories.validRepository, Seeds.Repositories.validRepository2]
    }
    
    func testGetReposIsCalled() {
        let worker = sut as! HomeGitStarsWorkerSpy
        
        sut.getRepos(page: 0) { _ in
        }
        
        XCTAssertTrue(worker.getReposCalled, "getRepos() should called")
    }
    
    func testGetReposCountExpectedRepositories() {
        var getRepositories = [Repository]()
        
        sut.getRepos(page: 0) { response in
            getRepositories = response.repositories!
        }
        
        XCTAssertEqual(HomeGitStarsWorkerTests.repositories.count, getRepositories.count, "getRepos() should return two repositories")
    }
}

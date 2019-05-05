//
//  HomeGitStarsViewControllerTests.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import XCTest

class HomeGitStarsViewControllerTests: XCTestCase {
    
    var sut: HomeGitStarsViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupHomeGitStarsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupHomeGitStarsViewController() {
        sut = HomeGitStarsViewController(nibName: nil, bundle: nil)
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.0))
    }
    
    func testShouldGetReposWhenViewWillAppear() {
        let spy = HomeGitStarsBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        sut.viewWillAppear(true)
        
        XCTAssertTrue(spy.getReposCalled, "viewWillAppear() should call getRepos()")
    }
    
    func testShouldReloadDataWhenDisplayReposIsCalled() {
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        
        let viewModel = [Seeds.ViewModelRepo.viewModel1, Seeds.ViewModelRepo.viewModel2]
        sut.displayRepos(viewModel: viewModel)
        
        XCTAssertTrue(tableViewSpy.reloadDataCalled, "displayRepo(viewModel:) should call reloadData()")
    }
    
    func testShouldLoadCellWhenViewWillAppear() {
        let repositories = [Seeds.ViewModelRepo.viewModel1, Seeds.ViewModelRepo.viewModel2]
        sut.repositories = repositories
        let spy = HomeGitStarsBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()
        sut.viewWillAppear(true)
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! RepositoryTableViewCell
        
        XCTAssertEqual(cell.repositoryView.labelRepoUser.text, Seeds.ViewModelRepo.viewModel1.fullName, "viewWillAppear() should load cell")
    }
}

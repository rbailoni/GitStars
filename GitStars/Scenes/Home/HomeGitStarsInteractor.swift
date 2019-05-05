//
//  HomeGitStarsInteractor.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

protocol HomeGitStarsBusinessLogic {
    func getRepos(request: HomeGitStars.Repos.Request)
}

protocol HomeGitStarsDataStore {
    var page: Int { get set }
}

class HomeGitStarsInteractor: HomeGitStarsBusinessLogic, HomeGitStarsDataStore {
    var presenter: HomeGitStarsPresentationLogic?
    var worker: HomeGitStarsWorkerProtocol? = HomeGitStarsWorker()
    var page: Int = 0
    
    
    func getRepos(request: HomeGitStars.Repos.Request) {
        if let newPage = request.page {
            page = newPage
        }
        page += 1
        
        worker?.getRepos(page: page, { response in
            self.presenter?.presentRepositories(response: response, isReload: request.isReload ?? false)
        })
    }
}

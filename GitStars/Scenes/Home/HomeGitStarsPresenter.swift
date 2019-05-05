//
//  HomeGitStarsPresenter.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

protocol HomeGitStarsPresentationLogic {
    func presentRepositories(response: HomeGitStars.Repos.Response, isReload: Bool)
}

class HomeGitStarsPresenter: HomeGitStarsPresentationLogic {
    weak var viewController: HomeGitStarsDisplayLogic?
    
    func presentRepositories(response: HomeGitStars.Repos.Response, isReload: Bool) {
        if let error = response.error {
            viewController?.displayError(erro: error)
        } else {
            guard let repositories = response.repositories else {
                viewController?.displayError(erro: NSError(domain: "", code: 400, userInfo: nil))
                return
            }
            var viewModel = [HomeGitStars.Repos.ViewModel]()
            for repository in repositories {
                viewModel.append(HomeGitStars.Repos.ViewModel(fullName: repository.fullName, stars: repository.stars, avatarUrl: repository.owner.avatarUrl, isReload: isReload))
            }
            viewController?.displayRepos(viewModel: viewModel)
        }
    }
}

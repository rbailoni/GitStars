//
//  HomeGitStarsModels.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

enum HomeGitStars {
    enum Repos {
        struct Request {
            let page: Int?
            let isReload: Bool?
        }
        
        struct Response {
            let error: Error?
            let repositories: [Repository]?
        }
        
        struct ViewModel {
            let fullName: String
            let stars: Int
            let avatarUrl: String
            let isReload: Bool
        }
    }
}

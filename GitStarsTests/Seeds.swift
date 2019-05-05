//
//  Seeds.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

@testable import GitStars
import XCTest

struct Seeds {
    struct Owners {
        static let validOwner = Owner(avatarUrl: "http://rbailoni.com.br")
    }
    struct Repositories {
        static let validRepository = Repository(fullName: "rbailoni/GitStars", stars: 5000, owner: Owners.validOwner)
        static let validRepository2 = Repository(fullName: "rbailoni/Testando", stars: 10, owner: Owners.validOwner)
    }
    
    struct ViewModelRepo {
        static let viewModel1 = HomeGitStars.Repos.ViewModel(fullName: "rbailoni/GitStars", stars: 5000, avatarUrl: "http://rbailoni.com.br", isReload: true)
        static let viewModel2 = HomeGitStars.Repos.ViewModel(fullName: "rbailoni/Testando", stars: 10, avatarUrl: "http://rbailoni.com.br", isReload: true)
    }
}

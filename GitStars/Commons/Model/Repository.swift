//
//  Repository.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import Foundation

struct Repository: Codable {
    let fullName: String
    let stars: Int
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case stars = "stargazers_count"
        case owner
    }
}

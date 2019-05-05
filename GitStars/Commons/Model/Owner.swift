//
//  Owner.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
}

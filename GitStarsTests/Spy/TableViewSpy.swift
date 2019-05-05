//
//  TableViewSpy.swift
//  GitStarsTests
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

class TableViewSpy: UITableView {
    var reloadDataCalled = false
    
    override func reloadData() {
        reloadDataCalled = true
    }
}

//
//  LoadingTableViewCell.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    let loadingActivity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .gray
        activity.startAnimating()
        return activity
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(loadingActivity)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Método não implementado")
    }
    
    func setConstraints() {
        loadingActivity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingActivity.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

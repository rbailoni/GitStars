//
//  RepositoryTableViewCell.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    let repositoryView: RepositoryView = {
        let view = RepositoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(repositoryView)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Método não implementado")
    }
    
    private func setConstraints() {
        repositoryView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        repositoryView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        repositoryView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        repositoryView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

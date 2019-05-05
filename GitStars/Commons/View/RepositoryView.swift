//
//  RepositoryView.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

var imageCache = NSCache<NSString, UIImage>()

class RepositoryView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .gray
        activity.startAnimating()
        return activity
    }()
    
    let imageAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 30.0
        return imageView
    }()
    
    let imageStars: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stars")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let labelStars: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelRepoUser: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var repository: HomeGitStars.Repos.ViewModel? {
        didSet{
            guard let repository = repository else { return }
            activityIndicator.startAnimating()
            imageAvatar.backgroundColor = .clear
            imageAvatar.image = nil
            labelStars.text = "\(repository.stars)"
            labelRepoUser.text = repository.fullName
            imageAvatar.loadImage(repository.avatarUrl)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        addElements()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .red
        commonInit()
    }
    
    func commonInit() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func addElements() {
        self.addSubview(activityIndicator)
        self.addSubview(imageAvatar)
        self.addSubview(imageStars)
        self.addSubview(labelStars)
        self.addSubview(labelRepoUser)
    }
    
    func setConstraints() {
        imageAvatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5.0).isActive = true
        imageAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageAvatar.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        imageAvatar.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        
        activityIndicator.centerYAnchor.constraint(equalTo: imageAvatar.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: imageAvatar.centerXAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalTo: imageAvatar.heightAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalTo: imageAvatar.widthAnchor).isActive = true
        
        imageStars.leftAnchor.constraint(equalTo: imageAvatar.rightAnchor, constant: 15).isActive = true
        imageStars.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        imageStars.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        imageStars.heightAnchor.constraint(equalTo: imageStars.widthAnchor, multiplier: 131.0/426.0).isActive = true
        
        labelStars.leftAnchor.constraint(equalTo: imageStars.leftAnchor).isActive = true
        labelStars.topAnchor.constraint(equalTo: imageStars.bottomAnchor, constant: 5).isActive = true
        labelStars.widthAnchor.constraint(equalTo: imageStars.widthAnchor).isActive = true
        
        labelRepoUser.leftAnchor.constraint(equalTo: imageStars.rightAnchor, constant: 20).isActive = true
        labelRepoUser.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        labelRepoUser.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

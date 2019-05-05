//
//  Extensions.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright © 2019 Ricardo Bailoni. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(_ urlString: String) {
        DispatchQueue.global(qos: .background).async {
            if let image = imageCache.object(forKey: NSString(string: urlString)) {
                self.setImage(image)
            }else {
                guard let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) else {
                    self.setImage()
                    return
                }
                DispatchQueue.main.async {
                    self.setImage(image)
                    imageCache.setObject(image, forKey: NSString(string: urlString))
                }
            }
        }
    }
    
    private func setImage(_ image: UIImage? = UIImage(named: "github")) {
        DispatchQueue.main.async {
            self.backgroundColor = .white
            self.image = image
        }
    }
}

//
//  UIImage + Extensions.swift
//  mvvmFlowCoordinator
//
//  Created by inputlagged on 10/16/22.
//

import Kingfisher
import UIKit.UIImageView

extension UIImageView {
    func setImage(_ url: String, catID: String) {
        guard let url = URL(string: url) else { return }
        let placeholder = UIImage(named: "catPlaceholder")
        let resource = ImageResource(downloadURL: url, cacheKey: catID)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: resource, placeholder: placeholder, options: [.transition(.fade(0.2))])
    }
}

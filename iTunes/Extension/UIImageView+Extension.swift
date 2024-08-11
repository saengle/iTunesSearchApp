//
//  UIImageView+Extension.swift
//  iTunesSearch
//
//  Created by 쌩 on 8/12/24.
//

import UIKit

import Kingfisher

extension UIImageView {
    func setMyImage(imagePath: String) {
        if let url = URL(string: "\(String(describing: imagePath))") {
            let processor = DownsamplingImageProcessor(size:  self.bounds.size)
            |> RoundCornerImageProcessor(cornerRadius: CGFloat(8))
            self.kf.indicatorType = .activity
            self.kf.setImage(
                with: url,
                options: [.processor(processor),
                          .scaleFactor(UIScreen.main.scale),
                          .transition(.fade(1)),
                          .cacheOriginalImage])
        }
    }
}

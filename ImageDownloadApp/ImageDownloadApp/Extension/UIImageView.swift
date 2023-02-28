//
//  UIImageView.swift
//  ImageDownloadApp
//
//  Created by 조주은 on 2023/02/28.
//

import Foundation
import UIKit

extension UIImageView {
    //MARK: - load Image from URL
    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

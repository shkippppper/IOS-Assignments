//
//  UIImageViewExtension.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}

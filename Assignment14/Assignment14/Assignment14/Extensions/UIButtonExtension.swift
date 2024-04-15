//
//  UIButtonExtension.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 14.04.24.
//

import UIKit

extension UIButton {
    class func createCustomButton(text: String, bgColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "FiraGO", size: 14)
        button.backgroundColor = bgColor
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return button
    }
}

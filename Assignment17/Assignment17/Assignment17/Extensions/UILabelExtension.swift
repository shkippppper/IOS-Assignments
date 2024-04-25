//
//  UILabelExtension.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

extension UILabel {
    static func createTitleLabel(text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = label.font.withSize(18)
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.textAlignment = .left
        return label
    }
}

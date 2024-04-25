//
//  UIViewExtension.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 23.04.24.
//

import UIKit

extension UIView {
    static func createCustomLabelView(leftTitle: String, rightTitle: String) -> UIView {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false

        let leftLabel = UILabel()
        leftLabel.text = leftTitle
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.font = leftLabel.font.withSize(14)
        leftLabel.textAlignment = .left

        let rightLabel = UILabel()
        rightLabel.text = rightTitle
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.font = rightLabel.font.withSize(14)
        rightLabel.textAlignment = .right

        mainView.addSubview(leftLabel)
        mainView.addSubview(rightLabel)

        NSLayoutConstraint.activate([
            mainView.heightAnchor.constraint(equalToConstant: 20),
            
            leftLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            leftLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 8),
            rightLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            rightLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            rightLabel.widthAnchor.constraint(equalTo: leftLabel.widthAnchor, multiplier: 2)
        ])

        return mainView
    }
}

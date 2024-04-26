//
//  UIViewExtension.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 23.04.24.
//

import UIKit

extension UIView {
    // MARK: Create Custom LabelView for Detailed View Details
    
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
    
    // MARK: Create Custom InputView for LoginPage inputs
    
    static func createCustomInputView(titleLabel: String, inputPlaceholder: String, isPassword: Bool = false) -> (UIView, UITextField) {
        let mainView = UIView()
        
        let inputLabelName = UILabel()
        inputLabelName.text = titleLabel
        inputLabelName.font = inputLabelName.font.withSize(11)
        inputLabelName.textAlignment = .left
        inputLabelName.translatesAutoresizingMaskIntoConstraints = false
        
        let inputTextField = UITextField()
        inputTextField.placeholder = inputPlaceholder
        inputTextField.borderStyle = .roundedRect
        inputTextField.layer.cornerRadius = 22
        inputTextField.backgroundColor = UIColor(named: "customPrimary")
        inputTextField.layer.borderColor = UIColor(named: "customPrimary")?.cgColor
        inputTextField.layer.borderWidth = 2
        inputTextField.layer.masksToBounds = true
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.isSecureTextEntry = isPassword ? true : false
        inputTextField.font = inputTextField.font?.withSize(11)
        
        mainView.addSubview(inputLabelName)
        mainView.addSubview(inputTextField)
        
        NSLayoutConstraint.activate([
            inputLabelName.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            inputLabelName.topAnchor.constraint(equalTo: mainView.topAnchor),
            inputLabelName.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            
            inputTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            inputTextField.topAnchor.constraint(equalTo: inputLabelName.bottomAnchor, constant: 6),
            inputTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
        
        return (mainView, inputTextField)
    }
}

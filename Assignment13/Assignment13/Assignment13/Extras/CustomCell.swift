//
//  CustomCell.swift
//  Assignment13
//
//  Created by Akaki Titberidze on 13.04.24.
//

import UIKit

class CustomCell: UITableViewCell {
    static let identifier = "CustomCell"
    
    var leftLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var rightLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    
    let myStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with leftLab: String, and rightLab: String){
        self.leftLabel.text = leftLab
        self.rightLabel.text = rightLab
    }
    
    func setupUI(){
        self.contentView.addSubview(myStackView)
        myStackView.addArrangedSubview(leftLabel)
        myStackView.addArrangedSubview(rightLabel)
        myStackView.alignment = .center
        
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            myStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            myStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            myStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            leftLabel.widthAnchor.constraint(equalTo: rightLabel.widthAnchor, multiplier: 0.5),
            leftLabel.leadingAnchor.constraint(equalTo: myStackView.leadingAnchor, constant: 20),
            leftLabel.topAnchor.constraint(equalTo: myStackView.topAnchor, constant: 20),
            leftLabel.bottomAnchor.constraint(equalTo: myStackView.bottomAnchor, constant: -20),
            
            rightLabel.trailingAnchor.constraint(equalTo: myStackView.trailingAnchor, constant: -20),
            rightLabel.topAnchor.constraint(equalTo: myStackView.topAnchor, constant: 20),
            rightLabel.bottomAnchor.constraint(equalTo: myStackView.bottomAnchor, constant: -20),
            rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor),
        ])
    }
    
}

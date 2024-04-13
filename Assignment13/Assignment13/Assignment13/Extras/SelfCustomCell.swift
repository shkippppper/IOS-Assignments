//
//  SelfCustomCell.swift
//  Assignment13
//
//  Created by Akaki Titberidze on 13.04.24.
//

import UIKit

class SelfCustomCell: UITableViewCell {
    static let identifier = "SelfCustomCell"
    
    var selfImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "questionmark")
        return image
    }()
    
    var selfName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = label.font.withSize(22)
        label.text = "Default"
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
    
    public func configure(with image: UIImage, and label: String){
        self.selfImage.image = image
        self.selfName.text = label
    }
    
    func setupUI(){
        self.contentView.addSubview(selfImage)
        self.contentView.addSubview(selfName)
        
        selfImage.translatesAutoresizingMaskIntoConstraints = false
        selfName.translatesAutoresizingMaskIntoConstraints = false
        selfImage.layer.cornerRadius = 30
        selfImage.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            selfImage.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            selfImage.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            selfImage.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            selfImage.heightAnchor.constraint(equalToConstant: 60),
            selfImage.widthAnchor.constraint(equalToConstant: 60),
            
            selfName.leadingAnchor.constraint(equalTo: self.selfImage.trailingAnchor, constant: 12),
            selfName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:  -12),
            selfName.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            selfName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
}

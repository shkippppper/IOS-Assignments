//
//  BasicInfoPairView.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//
import UIKit

class InfoPairView: UIView {
    
    let sumView = UIView()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textAlignment = .right
        return label
    }()
    
    init(name: String, value: String) {
        super.init(frame: .zero)
        nameLabel.text = name
        descriptionLabel.text = value
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        sumView.addSubview(nameLabel)
        sumView.addSubview(descriptionLabel)
        
        sumView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: sumView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: sumView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: sumView.bottomAnchor),
            
            descriptionLabel.trailingAnchor.constraint(equalTo: sumView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: sumView.topAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: sumView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
        ])
    }
}

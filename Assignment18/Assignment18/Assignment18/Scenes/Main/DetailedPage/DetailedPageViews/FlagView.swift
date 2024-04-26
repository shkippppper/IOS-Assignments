//
//  FlagView.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 22.04.24.
//
import UIKit

class FlagView: UIView {
    
    // MARK: - UI Components
    
    let flagDropShadow: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowRadius = 30
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.2
        return view
    }()
    
    let flagImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        return image
    }()
    
    let titleLabel = UILabel.createTitleLabel(text: "About the flag:")
    
    let labelInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup

    func setupLayout(){
        addSubview(flagDropShadow)
        flagDropShadow.addSubview(flagImage)
        addSubview(titleLabel)
        addSubview(labelInfo)
        
        flagDropShadow.translatesAutoresizingMaskIntoConstraints = false
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagDropShadow.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            flagDropShadow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            flagDropShadow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            flagDropShadow.heightAnchor.constraint(equalToConstant: 228),
            
            flagImage.topAnchor.constraint(equalTo: flagDropShadow.topAnchor),
            flagImage.leadingAnchor.constraint(equalTo: flagDropShadow.leadingAnchor),
            flagImage.trailingAnchor.constraint(equalTo: flagDropShadow.trailingAnchor),
            flagImage.bottomAnchor.constraint(equalTo: flagDropShadow.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: flagDropShadow.bottomAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            labelInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            labelInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            labelInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            labelInfo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
    }
    
    
    // MARK: - Helper Functions
    
    public func configure(image: UIImage, altInfo: String) {
        labelInfo.text = altInfo
        flagImage.image = image
    }
}

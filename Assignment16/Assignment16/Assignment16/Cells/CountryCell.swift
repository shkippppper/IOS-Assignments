//
//  CountryCell.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 21.04.24.
//


import UIKit

class CountryCell: UITableViewCell {
    
    let paddingView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        return view
    }()
    
    let countryLogoImageView: UIImageView = {
        let imageView = UIImageView()        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.text = "Demo Text"
        label.textAlignment = .right
        return label
    }()
    
    let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .black
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        addSubview(paddingView)
        paddingView.addSubview(countryLogoImageView)
        paddingView.addSubview(countryNameLabel)
        paddingView.addSubview(chevronImage)
        
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        countryLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            paddingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            paddingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            paddingView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            paddingView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            paddingView.heightAnchor.constraint(equalToConstant: 50),
            
            countryLogoImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 24),
            countryLogoImageView.heightAnchor.constraint(equalToConstant: 20),
            countryLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            countryLogoImageView.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
            
            countryNameLabel.trailingAnchor.constraint(equalTo: chevronImage.leadingAnchor, constant: -4),
            countryNameLabel.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
//            countryNameLabel.leadingAnchor.constraint(equalTo: countryLogoImageView.trailingAnchor, constant: 4),
            
            chevronImage.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -24),
            chevronImage.centerYAnchor.constraint(equalTo: paddingView.centerYAnchor),
        ])
    }
    public func configure(imageUrl: String, countryName: String){
        countryNameLabel.text = countryName
        if let imageURL = URL(string: imageUrl) {
            countryLogoImageView.loadImage(from: imageURL)
        }else{
            countryLogoImageView.image = UIImage(named: "tempImage")
        }
    }
}

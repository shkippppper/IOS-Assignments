//
//  NewsCell.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 20.04.24.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let paddingView = UIView()
    let backImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "tempImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    //image tint
    let backgroundTintView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(_colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.6)
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .white
        label.font = label.font.withSize(12)
        return label
    }()
    
    let mainTextLabel: UILabel = {
        let label = UILabel()
        label.text = "dummy text"
        label.textColor = .white
        label.font = label.font.withSize(14)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
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
        paddingView.addSubview(backImageView)
        backImageView.addSubview(backgroundTintView)
        backgroundTintView.addSubview(timeLabel)
        backgroundTintView.addSubview(mainTextLabel)
        
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundTintView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        mainTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paddingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            paddingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            paddingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            paddingView.topAnchor.constraint(equalTo: topAnchor),
            
            backImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 12),
            backImageView.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -12),
            backImageView.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 8),
            backImageView.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -8),
            backImageView.heightAnchor.constraint(equalToConstant: 115),
            
            backgroundTintView.leadingAnchor.constraint(equalTo: backImageView.leadingAnchor),
            backgroundTintView.trailingAnchor.constraint(equalTo: backImageView.trailingAnchor),
            backgroundTintView.bottomAnchor.constraint(equalTo: backImageView.bottomAnchor),
            backgroundTintView.topAnchor.constraint(equalTo: backImageView.topAnchor),
            
            timeLabel.centerXAnchor.constraint(equalTo: backgroundTintView.centerXAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: mainTextLabel.topAnchor, constant: -5),
            
            mainTextLabel.centerXAnchor.constraint(equalTo: backgroundTintView.centerXAnchor),
            mainTextLabel.centerYAnchor.constraint(equalTo: backgroundTintView.centerYAnchor),
            mainTextLabel.leadingAnchor.constraint(equalTo: backgroundTintView.leadingAnchor, constant: 16),
            mainTextLabel.trailingAnchor.constraint(equalTo: backgroundTintView.trailingAnchor, constant: -16),
        ])
    }
    public func configure(title: String, time: String, image: String){
        mainTextLabel.text = title
        timeLabel.text = time
        if let imageUrl = URL(string: image) {
            backImageView.loadImage(from: imageUrl)
        }else{
            backImageView.image = UIImage(named: "tbcBanner")
        }
    }
}

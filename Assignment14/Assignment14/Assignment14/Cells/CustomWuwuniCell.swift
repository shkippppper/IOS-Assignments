//
//  CustomWuwuniCell.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

class CustomWuwuniCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "CustomWuwuniCell"
    let selectedStatus: Status = .Started
    let selectedIcon: String = ""
    let selectedPrimary: String = ""
    let selectedDescription: String = ""
    
    // MARK: Components
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "customBlueGray")
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    let paddingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    let iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iconBlue")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 4
        return view
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 10)
        label.textColor = .white
        label.text = "Completed"
        label.setLineHeight(18)
        return label
    }()
    
    let primaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 16)
        label.textColor = .white
        label.text = "default text default text default text default text"
        label.numberOfLines = 0
        label.setLineHeight(24)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 10)
        label.textColor = UIColor(named: "customLightGray")
        label.text = "default text default text"
        label.numberOfLines = 0
        label.sizeToFit()
        label.setLineHeight(15)
        return label
    }()
    
    // MARK: Setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupData()
    }
    
    func setupUI(){
        addSubview(mainView)
        mainView.addSubview(paddingView)
        paddingView.addSubview(iconImageView)
        paddingView.addSubview(statusView)
        statusView.addSubview(statusLabel)
        paddingView.addSubview(primaryLabel)
        paddingView.addSubview(descriptionLabel)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            paddingView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            paddingView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            paddingView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            paddingView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            
            iconImageView.topAnchor.constraint(equalTo: paddingView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            
            statusView.topAnchor.constraint(equalTo: topAnchor),
            statusView.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusView.heightAnchor.constraint(equalToConstant: 20),
            
            statusLabel.centerXAnchor.constraint(equalTo: statusView.centerXAnchor),
            statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -4),
            
            primaryLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            primaryLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            primaryLabel.heightAnchor.constraint(equalToConstant: 50),
            primaryLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 12),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: primaryLabel.bottomAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor)
        ])
        
    }
    
    func setupData(){
        setupStatus(status: .Started)
    }
    
    func setupStatus(status: Status){
        switch status {
        case .Started:
            statusView.backgroundColor = .systemBlue
            statusLabel.text = "Started"
            mainView.layer.borderColor = UIColor.systemBlue.cgColor
        case .Planning:
            statusView.backgroundColor = .systemPurple
            statusLabel.text = "Planning"
            mainView.layer.borderColor = UIColor.systemPurple.cgColor
        case .Late:
            statusView.backgroundColor = .systemOrange
            statusLabel.text = "Late"
            mainView.layer.borderColor = UIColor.systemOrange.cgColor
        case .Postponed:
            statusView.backgroundColor = .systemMint
            statusLabel.text = "Postponed"
            mainView.layer.borderColor = UIColor.systemMint.cgColor
        case .Finished:
            statusView.backgroundColor = .systemGreen
            statusLabel.text = "Finished"
            mainView.layer.borderColor = UIColor.systemGreen.cgColor
        case .Declined:
            statusView.backgroundColor = .systemRed
            statusLabel.text = "Declined"
            mainView.layer.borderColor = UIColor.systemRed.cgColor
        }
    }
    
    func configure(image: UIImage, primary: String, description: String, status: Status){
        iconImageView.image = image
        primaryLabel.text = primary
        descriptionLabel.text = description
        setupStatus(status: status)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

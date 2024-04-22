//
//  UsefulLinksView.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

class UsefulLinksView: UIView {
    
    var streetMapUrlString: String?
    var googleMapUrlString: String?
    
    let titleLabel = UILabel.createTitleLabel(text: "Useful links:")
    
    let streetMapsLogo: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "openStreetLogo"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let googleMapsLogo: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.setImage(UIImage(named: "googleMapsLogo"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        addSubview(titleLabel)
        addSubview(streetMapsLogo)
        addSubview(googleMapsLogo)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        streetMapsLogo.translatesAutoresizingMaskIntoConstraints = false
        googleMapsLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            streetMapsLogo.heightAnchor.constraint(equalToConstant: 50),
            streetMapsLogo.widthAnchor.constraint(equalToConstant: 50),
            streetMapsLogo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -100),
            streetMapsLogo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
            googleMapsLogo.heightAnchor.constraint(equalToConstant: 50),
            googleMapsLogo.widthAnchor.constraint(equalToConstant: 50),
            googleMapsLogo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 100),
            googleMapsLogo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            googleMapsLogo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }

    
    func setupData(){
        streetMapsLogo.addAction(UIAction(handler: { _ in
            self.openLink(link: self.streetMapUrlString ?? "")
        }), for: .touchUpInside)
        googleMapsLogo.addAction(UIAction(handler: { _ in
            self.openLink(link: self.googleMapUrlString ?? "")
        }), for: .touchUpInside)
    }
    
    func openLink(link: String){
        if let url = URL(string: link){
            UIApplication.shared.open(url)
        }
    }
    
    public func configure(streetMapUrl: String, googleMapUrl: String){
        self.streetMapUrlString = streetMapUrl
        self.googleMapUrlString = googleMapUrl
    }
}

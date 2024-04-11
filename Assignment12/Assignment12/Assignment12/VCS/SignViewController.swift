//
//  SignViewController.swift
//  Assignment12
//
//  Created by Akaki Titberidze on 11.04.24.
//

import UIKit


class SignViewController: UIViewController {
    
    var zodiacInfo: ZodiacSignInfo? = nil
    let mainStackView = UIStackView()
    let signImage = UIImageView()
    let signName = UILabel()
    let signDescription = UITextView()
    let polarButton = UIButton.customizedButton(customColor: .purple, text: "პოლარული ნიშანი")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        polarButton.addTarget(self, action: #selector(goToPolarSignVC), for: .touchUpInside)
    }
    
    @objc func goToPolarSignVC(){
        let polarSignVc = PolarSignView()
        polarSignVc.zodiacInfo = zodiacInfo
        navigationController?.pushViewController(polarSignVc, animated: true)
    }
}

extension SignViewController {
    func style(){
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mainBackground")!)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 30
        mainStackView.alignment = .center
        mainStackView.distribution = .fillProportionally
        
        signImage.translatesAutoresizingMaskIntoConstraints = false
        signImage.image = UIImage(named: zodiacInfo?.imageName ?? "mainBackground")
        signImage.contentMode = .scaleAspectFit
        
        signName.text = zodiacInfo?.sign.rawValue
        signName.textColor = .white
        signName.font = signName.font.withSize(24)
    
        signDescription.translatesAutoresizingMaskIntoConstraints = false
        signDescription.text = zodiacInfo?.description
        signDescription.textColor = UIColor(named: "TintWhite")
        signDescription.font = signDescription.font?.withSize(16)
        signDescription.isScrollEnabled = false
        signDescription.backgroundColor = .clear
        

    }
    
    func layout(){
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(signImage)
        mainStackView.addArrangedSubview(signName)
        mainStackView.addArrangedSubview(signDescription)
        mainStackView.addArrangedSubview(polarButton)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -124),
            
            signImage.heightAnchor.constraint(equalToConstant: 156),
            signImage.widthAnchor.constraint(equalTo: signImage.heightAnchor),
            signImage.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 0),
            signImage.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            
            signName.topAnchor.constraint(equalTo: signImage.bottomAnchor),
            signName.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            signName.heightAnchor.constraint(equalToConstant: 34),
            
            signDescription.topAnchor.constraint(equalTo: signName.bottomAnchor, constant: 30),
            signDescription.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            signDescription.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            signDescription.heightAnchor.constraint(greaterThanOrEqualToConstant: 100),
        
            polarButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            polarButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            polarButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            polarButton.topAnchor.constraint(equalTo: signDescription.bottomAnchor),
        ])
    }
}

//
//  PolarSignView.swift
//  Assignment12
//
//  Created by Akaki Titberidze on 11.04.24.
//

import UIKit

class PolarSignView: UIViewController {
    
    var zodiacInfo: ZodiacSignInfo? = nil
    var polarImageView = UIImageView()
    var polarName = UILabel()
    var buttonRed = UIButton.customizedButton(customColor: .red, text: "წითელი")
    var buttonBlue = UIButton.customizedButton(customColor: .blue, text: "ლურჯი")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        buttonRed.addTarget(self, action: #selector(buttonRedClicked), for: .touchUpInside)
        buttonBlue.addTarget(self, action: #selector(buttonBlueClicked), for: .touchUpInside)

    }
    
    @objc func buttonRedClicked() {
        let mainVC = ViewController()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.backColor = .red
        navigationController?.pushViewController(mainVC, animated: true)
    }

    @objc func buttonBlueClicked() {
        let mainVC = ViewController()
        mainVC.modalPresentationStyle = .fullScreen
        mainVC.backColor = .blue
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

extension PolarSignView {
    func style() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mainBackground")!)
        polarImageView.translatesAutoresizingMaskIntoConstraints = false
        polarName.translatesAutoresizingMaskIntoConstraints = false
        buttonRed.translatesAutoresizingMaskIntoConstraints = false
        buttonBlue.translatesAutoresizingMaskIntoConstraints = false
        
        polarImageView.image = UIImage(named: zodiacInfo!.polarImageName)
        
        polarName.font = polarName.font.withSize(26)
        polarName.textColor = .white
        polarName.text = zodiacInfo?.polarSign.rawValue
    }
    
    func layout() {
        view.addSubview(polarImageView)
        view.addSubview(polarName)
        view.addSubview(buttonRed)
        view.addSubview(buttonBlue)
        
        NSLayoutConstraint.activate([
            
            
            polarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polarImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            polarImageView.heightAnchor.constraint(equalToConstant: 164),
            polarImageView.widthAnchor.constraint(equalToConstant: 164),
            
            polarName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polarName.topAnchor.constraint(equalTo: polarImageView.bottomAnchor, constant: -8),
            
            buttonBlue.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -102),
            buttonBlue.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            buttonBlue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
            buttonRed.bottomAnchor.constraint(equalTo: buttonBlue.topAnchor, constant: -32),
            buttonRed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            buttonRed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            
        ])
    }
}

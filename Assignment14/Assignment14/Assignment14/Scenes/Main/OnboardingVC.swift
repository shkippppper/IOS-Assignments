//
//  OnboardingVC.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 14.04.24.
//

import UIKit

class OnboardingVC: UIViewController {

    let backgroundImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "OnBoarding")
        return image
    }()
    
    let launchLabel: UILabel = {
        var label = UILabel()
        label.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        label.textColor = .white
        label.font = UIFont(name: "FiraGO", size: 30)
        label.numberOfLines = 0
        label.setLineHeight(48)
        return label
    }()
    
    let startButton = UIButton.createCustomButton(text: "დაწყება", bgColor: UIColor.init(named: "customBlue")!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData(){
        startButton.addTarget(self, action: #selector(goToMainPage), for: .touchUpInside)
    }
    
    func setupUI(){
        view.addSubview(backgroundImage)
        view.addSubview(launchLabel)
        view.addSubview(startButton)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        launchLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            launchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            launchLabel.widthAnchor.constraint(equalToConstant: 260),
            launchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/2),
            
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.widthAnchor.constraint(equalToConstant: 123),
        ])
    }
    
    @objc func goToMainPage(){
        let nextVC = MainPageVC()
        self.navigationController?.setViewControllers([nextVC], animated: true)
    }
}

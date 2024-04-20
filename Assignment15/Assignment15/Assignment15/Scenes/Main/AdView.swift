//
//  AdView.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 20.04.24.
//

import UIKit

class AdView: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "ძვირია რეკლამა...💀"
        label.font = label.font.withSize(24)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func setupData() {
        
    }
}

//
//  SyllabusVC.swift
//  Assignment12
//
//  Created by Akaki Titberidze on 11.04.24.
//

import Foundation

import UIKit

class SyllabusVC: ViewController {
    
    let newView = UIView()
    let newLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNewView()
    }
    
    func setupNewView(){
        view.backgroundColor = .white
        
        view.addSubview(newView)
        newView.addSubview(newLabel)
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newView.topAnchor.constraint(equalTo: view.topAnchor),
            newView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newLabel.centerXAnchor.constraint(equalTo: newView.centerXAnchor),
            newLabel.centerYAnchor.constraint(equalTo: newView.centerYAnchor),
            newLabel.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 24),
            newLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: 24),
        ])
        
        newView.backgroundColor = .white
        
        newLabel.text = "სადაა სილაბუსი და კაი ცხოვრება...🥲"
        newLabel.font = newLabel.font.withSize(30)
        newLabel.numberOfLines = 0
    }
}

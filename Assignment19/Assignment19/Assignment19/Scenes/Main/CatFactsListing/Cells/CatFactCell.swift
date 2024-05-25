//
//  CatFactCell.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 03.05.24.
//

import UIKit

class CatFactCell: UITableViewCell {
    
    // MARK: - UI Components
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.numberOfLines = 0
        return label
    }()
    
    let indexLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(15)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    func setupLayout(){
        backgroundColor = .white
        addSubview(indexLabel)
        addSubview(mainLabel)
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            mainLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            indexLabel.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 12),
            indexLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            indexLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            indexLabel.widthAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    // MARK: - Helper Functions
    
    internal func configure(fact: String, index: String) {
        mainLabel.text = fact
        indexLabel.text = index
    }
}

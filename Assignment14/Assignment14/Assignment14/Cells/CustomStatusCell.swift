//
//  CustomStatusCell.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

class CustomStatusCell: UICollectionViewCell {
    
    // MARK: Variables
    
    static let identifier = "CustomStatusCell"
    
    // MARK: Components
    
    let statusView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 4
        return view
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO", size: 16)
        label.textColor = .white
        label.text = "Completed"
        label.setLineHeight(20)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: Setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        addSubview(statusView)
        statusView.addSubview(statusLabel)
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusView.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusView.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusView.topAnchor.constraint(equalTo: topAnchor),
            statusView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 6),
            statusLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -6),
            statusLabel.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 2),
            statusLabel.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -2),
        ])
        
    }
    
    func setupStatus(status: Status){
        switch status {
        case .Started:
            statusView.backgroundColor = .systemBlue
            statusLabel.text = "Started"
        case .Planning:
            statusView.backgroundColor = .systemPurple
            statusLabel.text = "Planning"
        case .Late:
            statusView.backgroundColor = .systemOrange
            statusLabel.text = "Late"
        case .Postponed:
            statusView.backgroundColor = .systemMint
            statusLabel.text = "Postponed"
        case .Finished:
            statusView.backgroundColor = .systemGreen
            statusLabel.text = "Finished"
        case .Declined:
            statusView.backgroundColor = .systemRed
            statusLabel.text = "Declined"
        }
    }
    
    func configure(status: Status){
        setupStatus(status: status)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  BasicInfoCell.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

class BasicInfoView: UIView {
    
    let titleLabel = UILabel.createTitleLabel(text: "Basic information:")
    
    let infoStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        infoStackView.axis = .vertical
        infoStackView.spacing = 15
        infoStackView.distribution = .equalSpacing
        infoStackView.alignment = .fill
    }
    
    func setupLayout() {
        addSubview(titleLabel)
        addSubview(infoStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            infoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func configure(
        name: String,
        officialName: String,
        population: String,
        independent: String,
        region: String,
        subregion: String,
        startOfWeek: String,
        flag: String,
        unMember: String
    ) {
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Population", rightTitle: population))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Independent", rightTitle: independent))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Region", rightTitle: region))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Subregion", rightTitle: subregion))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Name", rightTitle: name))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Official Name", rightTitle: officialName))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Start of Week", rightTitle: startOfWeek))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "Flag", rightTitle: flag))
        infoStackView.addArrangedSubview(UIView.createCustomLabelView(leftTitle: "UN Member", rightTitle: unMember))
    }
}

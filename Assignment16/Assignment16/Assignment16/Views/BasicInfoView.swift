//
//  BasicInfoCell.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

class BasicInfoView: UIView {
    
    let titleLabel = UILabel.createTitleLabel(text: "Basic information:")
    
    let populationLabel = UILabel()
    let independentLabel = UILabel()
    let regionLabel = UILabel()
    let subregionLabel = UILabel()
    let nameLabel = UILabel()
    let officialNameLabel = UILabel()
    let startOfWeekLabel = UILabel()
    let flagLabel = UILabel()
    let unMemberLabel = UILabel()
    
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
        populationLabel.font = UIFont.systemFont(ofSize: 16)
        independentLabel.font = UIFont.systemFont(ofSize: 16)
        regionLabel.font = UIFont.systemFont(ofSize: 16)
        subregionLabel.font = UIFont.systemFont(ofSize: 16)
        
        infoStackView.axis = .vertical
        infoStackView.spacing = 15
        infoStackView.distribution = .equalSpacing
        infoStackView.alignment = .fill
        
        infoStackView.addArrangedSubview(populationLabel)
        infoStackView.addArrangedSubview(independentLabel)
        infoStackView.addArrangedSubview(regionLabel)
        infoStackView.addArrangedSubview(subregionLabel)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(officialNameLabel)
        infoStackView.addArrangedSubview(startOfWeekLabel)
        infoStackView.addArrangedSubview(flagLabel)
        infoStackView.addArrangedSubview(unMemberLabel)
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
        populationLabel.text = "Population: \(population)"
        independentLabel.text = "Independent: \(independent)"
        regionLabel.text = "Region: \(region)"
        subregionLabel.text = "Subregion: \(subregion)"
        nameLabel.text = "Name: \(name)"
        officialNameLabel.text = "Official Name: \(officialName)"
        startOfWeekLabel.text = "Subregion: \(startOfWeek)"
        flagLabel.text = "Subregion: \(flag)"
        unMemberLabel.text = "Subregion: \(unMember)"
    }
}

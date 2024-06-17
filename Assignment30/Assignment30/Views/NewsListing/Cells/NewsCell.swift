//
//  NewsCell.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import UIKit
import SwiftUI

class NewsCell: UITableViewCell {
    // MARK: - UI Components
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.textAlignment = .right
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
        addSubview(cellImageView)
        addSubview(dateLabel)
        addSubview(titleLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 4),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    // MARK: - Helper Functions
    public func configure( imageUrl: String, fact: String, date: String) {
        if let imageURL = URL(string: imageUrl) {
            cellImageView.loadImage(from: imageURL)
        }else{
            cellImageView.image = UIImage(named: "tempImage")
        }
        titleLabel.text = fact
        dateLabel.text = date
        
        setupAccessibility(titleLabelData: fact, dateLabelData: date)
        setupDynamicType()
    }
    
    private func setupAccessibility(titleLabelData: String, dateLabelData: String) {
        cellImageView.isAccessibilityElement = true
        cellImageView.accessibilityLabel = "News Image"
        cellImageView.accessibilityTraits = .image

        titleLabel.isAccessibilityElement = true
        titleLabel.accessibilityLabel = "Title: \(titleLabelData)"
    
        dateLabel.isAccessibilityElement = true
        dateLabel.accessibilityLabel = "Published Date: \(dateLabelData)"
    }
    
    private func setupDynamicType() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }
}

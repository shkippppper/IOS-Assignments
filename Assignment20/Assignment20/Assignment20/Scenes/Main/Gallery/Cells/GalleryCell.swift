//
//  GalleryCell.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 08.05.24.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    
    // MARK: - Variables
    
    static let identifier = "GalleryCell"
    
    // MARK: - UI Components
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    public func configure(imageUrl: String) {
        if let imageURL = URL(string: imageUrl) {
            cellImageView.loadImage(from: imageURL)
        }else{
            cellImageView.image = UIImage(named: "tempImage")
        }
        self.setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI(){
        addSubview(cellImageView)
        
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

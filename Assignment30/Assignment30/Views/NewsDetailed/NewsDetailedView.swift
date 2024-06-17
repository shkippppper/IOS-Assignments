//
//  NewsDetailedView.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import UIKit

class NewsDetailedView: UIViewController {
    
    // MARK: - Variables
    
    var newsTitle: String
    var imageUrl: String
    var newsDate: String
    var newsDescription: String
    var newsAuthor: String
    
    // MARK: - UI Components
    
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
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
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()
    
    let authorDateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    init(newsTitle: String, imageUrl: String, newsDate: String, newsDescription: String, newsAuthor: String) {
        self.newsTitle = newsTitle
        self.imageUrl = imageUrl
        self.newsDate = newsDate
        self.newsDescription = newsDescription
        self.newsAuthor = newsAuthor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        setupAccessibility()
        setupDynamicType()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(newsImageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(authorDateStackView)
        authorDateStackView.addArrangedSubview(authorLabel)
        authorDateStackView.addArrangedSubview(dateLabel)
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        authorDateStackView.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            newsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newsImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            newsImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            authorDateStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorDateStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorDateStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
        ])
    }
    
    private func setupData() {
        if let imageURL = URL(string: imageUrl) {
            newsImageView.loadImage(from: imageURL)
        }else{
            newsImageView.image = UIImage(named: "tempImage")
        }
        titleLabel.text = newsTitle
        descriptionLabel.text = newsDescription
        authorLabel.text = newsAuthor
        dateLabel.text = newsDate
    }
    
    private func setupAccessibility() {
        newsImageView.isAccessibilityElement = true
        newsImageView.accessibilityLabel = "News Image"
        newsImageView.accessibilityTraits = .image

        titleLabel.isAccessibilityElement = true
        titleLabel.accessibilityLabel = "Title: \(newsTitle)"
        
        descriptionLabel.isAccessibilityElement = true
        descriptionLabel.accessibilityLabel = "Description: \(newsDescription)"
        
        authorLabel.isAccessibilityElement = true
        authorLabel.accessibilityLabel = "Author: \(newsAuthor)"
        
        dateLabel.isAccessibilityElement = true
        dateLabel.accessibilityLabel = "Published Date: \(newsDate)"
    }
    
    private func setupDynamicType() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        authorLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        dateLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
    }

}

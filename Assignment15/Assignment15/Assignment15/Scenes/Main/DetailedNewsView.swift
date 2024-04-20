//
//  DetailedNewsView.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 20.04.24.
//

import UIKit

class DetailedNewsView: UIViewController {
    
    var setupInfo: NewsModel?
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    let detailTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = label.font.withSize(16)
        return label
    }()
    
    let detailTextLabel: UILabel = {
        let label = UILabel()
        label.text = "dummy text"
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        return label
    }()
    
    let detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("წაიკითხე ვრცლად", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        return button
    }()
    
    let detailAd: UIButton = {
        let button = UIButton()
        button.setTitle("შენი რეკლამა აქ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Serif", size: 30)
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemGreen
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(detailImageView)
        view.addSubview(detailTimeLabel)
        view.addSubview(detailTextLabel)
        view.addSubview(detailAd)
        view.addSubview(detailButton)
        
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTextLabel.translatesAutoresizingMaskIntoConstraints = false
        detailAd.translatesAutoresizingMaskIntoConstraints = false
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            detailImageView.heightAnchor.constraint(equalToConstant: 190),
            
            detailTimeLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 13),
            detailTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            detailTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            detailTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            detailTextLabel.topAnchor.constraint(equalTo: detailTimeLabel.bottomAnchor, constant: 26),
            
            detailAd.bottomAnchor.constraint(equalTo: detailButton.topAnchor, constant: -20),
            detailAd.heightAnchor.constraint(equalToConstant: 100),
            detailAd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailAd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            detailButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            detailButton.heightAnchor.constraint(equalToConstant: 40),
            detailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            detailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func setupData() {
        self.title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        detailButton.addAction(UIAction(handler: { _ in
            self.openLink()
        }), for: .touchUpInside)
        
        detailAd.addAction(UIAction(handler: { _ in
            self.pushToAd()
        }), for: .touchUpInside)
        
        guard let info = setupInfo else { return }
        detailTimeLabel.text = info.time
        detailTextLabel.text = info.title
        if let imageUrl = URL(string: info.photoUrl) {
            detailImageView.loadImage(from: imageUrl)
        }
    }
    
    func openLink() {
        guard let info = setupInfo else { return }
        
        if let url = URL(string: info.url) {
            UIApplication.shared.open(url)
        }
    }
    
    func pushToAd() {
        let adView = AdView()
        navigationController?.pushViewController(adView, animated: true)
    }
}

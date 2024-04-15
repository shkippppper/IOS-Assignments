//
//  MainPageVC.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 14.04.24.
//

import UIKit

class MainPageVC: UIViewController, CreateNewCardDelegate {


    // MARK: Variables
    var wuwunis = [Wuwuni]()
    
    // MARK: Component Declaration

    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MainBackground")
        return image
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        collView.register(CustomWuwuniCell.self, forCellWithReuseIdentifier: "CustomWuwuniCell")
        return collView
    }()
    
    let tipTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ℹ️ ბარათის წასაშლელად დააჭირეთ ბარათს ℹ️"
        label.font = UIFont(name: "FiraGO", size: 14)
        label.textColor = UIColor(named: "customLightGray")
        label.setLineHeight(20)
        return label
    }()
    
    let createButton = UIButton.createCustomButton(text: "ახალი წუწუნ ბარათის შექმნა", bgColor: UIColor.init(named: "customBlue")!)
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
        setupData()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func loadData(){
        wuwunis = WuwuniData().wuwunis
    }
    
    func setupUI(){
        view.addSubview(backgroundImage)
        view.addSubview(collectionView)
        view.addSubview(createButton)
        view.addSubview(tipTitleLabel)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        tipTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -48),

            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 290),
            
            tipTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tipTitleLabel.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -15)
        ])
    }
    
    func setupData(){
        createButton.addTarget(self, action: #selector(pushToCreatePage), for: .touchUpInside)
        
    }
    
    // MARK: Functions
    
    @objc func pushToCreatePage(){
        let addVC = CreateNewCardVC()
        addVC.delegate = self
        addVC.wuwunisData = wuwunis
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    func didCreateNewCard(newData: [Wuwuni]) {
        wuwunis = newData
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    
}

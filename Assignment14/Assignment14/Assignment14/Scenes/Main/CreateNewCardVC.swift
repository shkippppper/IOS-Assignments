//
//  CreateNewCardVC.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 14.04.24.
//


import UIKit

class CreateNewCardVC: UIViewController{
    
    // MARK: Variables
    
    var selectedIcon: Int = 1
    let iconNames = ["iconRed", "iconBlue", "iconGreen", "iconYellow"]
    var wuwunisData = [Wuwuni]()
    var statuses = [Status]()
    weak var delegate: CreateNewCardDelegate?
    var selectedIndex = 0
    
    // MARK: Component Declaration
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MainBackground")
        return image
    }()
    
    let titleDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        return stackView
    }()
    
    let titleView = UIView()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "სათაური"
        label.font = UIFont(name: "FiraGO", size: 14)
        label.textColor = .white
        label.setLineHeight(24)
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: პანიკა, დახმარება მჭირდება",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "customLightGray")!]
        )
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "customBlueGray")
        textField.layer.borderColor = UIColor(named: "customLightGray")?.cgColor
        textField.font = UIFont(name: "FiraGO", size: 12)
        textField.textColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        return textField
    }()
    
    let descriptionView = UIView()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "აღწერა"
        label.font = UIFont(name: "FiraGO", size: 14)
        label.textColor = .white
        label.setLineHeight(24)
        return label
    }()
    
    let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "customLightGray")!]
        )
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(named: "customBlueGray")
        textField.layer.borderColor = UIColor(named: "customLightGray")?.cgColor
        textField.font = UIFont(name: "FiraGO", size: 12)
        textField.textColor = .white
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        return textField
    }()
    
    let iconLabel: UILabel = {
        let label = UILabel()
        label.text = "აირჩიეთ აიქონი"
        label.font = UIFont(name: "FiraGO", size: 14)
        label.textColor = .white
        label.setLineHeight(24)
        return label
    }()
    
    let iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 28
//        stackView.alignment = .center
        return stackView
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "აირჩიეთ სტატუსი"
        label.font = UIFont(name: "FiraGO", size: 14)
        label.textColor = .white
        label.setLineHeight(24)
        return label
    }()

    let statusCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        let colView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colView.backgroundColor = .clear
        colView.register(CustomStatusCell.self, forCellWithReuseIdentifier: "CustomStatusCell")
        return colView
    }()
    
    let createButton = UIButton.createCustomButton(text: "დამატება", bgColor: UIColor.init(named: "customGreen")!)
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
        loadData()
        
        statusCollectionView.dataSource = self
        statusCollectionView.delegate = self
    }
    
    func setupData(){
        createButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
        setupIconView()
    }
    
    func setupUI(){
        view.addSubview(backgroundImage)
        view.addSubview(titleDescriptionStackView)
        titleDescriptionStackView.addArrangedSubview(titleView)
        titleDescriptionStackView.addArrangedSubview(descriptionView)
        titleView.addSubview(titleLabel)
        titleView.addSubview(titleTextField)
        descriptionView.addSubview(descriptionLabel)
        descriptionView.addSubview(descriptionTextField)
        view.addSubview(iconLabel)
        view.addSubview(iconStackView)
        view.addSubview(statusLabel)
        view.addSubview(statusCollectionView)
        view.addSubview(createButton)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusCollectionView.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleDescriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            titleDescriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            titleDescriptionStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleDescriptionStackView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            
            titleTextField.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            titleTextField.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            titleTextField.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 45),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor, constant: 10),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            
            descriptionTextField.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            descriptionTextField.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor),
            descriptionTextField.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 45),
            
            iconLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            iconLabel.topAnchor.constraint(equalTo: titleDescriptionStackView.bottomAnchor, constant: 30),
            
            iconStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iconStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            iconStackView.topAnchor.constraint(equalTo: iconLabel.bottomAnchor, constant: 14),
            iconStackView.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            statusLabel.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: 30),
            
            statusCollectionView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 14),
            statusCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            statusCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            statusCollectionView.bottomAnchor.constraint(equalTo: createButton.topAnchor, constant: -30),
            
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 132)
        ])
    }
    
    func loadData(){
        statuses = StatusData().statuses
    }
    
    func setupIconView(){
        let uiView1 = UIView()
        let uiView2 = UIView()

        iconStackView.addArrangedSubview(uiView1) // add leading view
        
        for (index, iconName) in iconNames.enumerated() {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: iconName), for: .normal)
            button.contentMode = .scaleAspectFit
            button.tag = index + 1
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.layer.borderColor = UIColor.white.cgColor
            if button.tag == 1 {
                button.layer.borderWidth = 2
            }
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            button.addTarget(self, action: #selector(iconTapped), for: .touchUpInside)
            iconStackView.addArrangedSubview(button) // add button view
        }
        
        iconStackView.addArrangedSubview(uiView2) // add trailing view
    }
    
    // MARK: Functions
    
    @objc func addNewCard(){
        wuwunisData.insert(Wuwuni(image: UIImage(named: iconNames[selectedIcon - 1])!, primaryText: titleTextField.text!, descriptionText: descriptionTextField.text!, creationDate: Date.now, status: statuses[selectedIndex]), at: 0)
        delegate?.didCreateNewCard(newData: wuwunisData)
               
        navigationController?.popViewController(animated: true)
    }
    
    @objc func iconTapped(sender: UIButton) {
        let buttonTag = sender.tag
        removeButtonsBorder()
        sender.layer.borderWidth = 2
        selectedIcon = buttonTag
    }
    
    func removeButtonsBorder(){
        iconStackView.arrangedSubviews.forEach({$0.layer.borderWidth = 0})
    }
}

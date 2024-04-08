//
//  ViewController.swift
//  Assignment11
//
//  Created by Akaki Titberidze on 07.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    // ბოლოს აღმოვაჩინე რომ ბევრი რაღაცის შემოკლება შეიძლებოდა უბრალოდ დრო აღარ მაქვს რომ შევამოკლო...

    //MARK: Variables
    
    var myFont = "Optima"
    
    var contentView = UIView()
    var laptopImage = UIImageView()
    var welcomeStackView = UIStackView()
    var authView = UIView()
    var authHeaderText = UILabel()
    var authDividerView = UIView()
    var authFieldsStackView = UIStackView()
    var authNameView = UIView()
    var authNameLabel = UILabel()
    var authNameTextField = UITextField()
    var authEmailView = UIView()
    var authEmailLabel = UILabel()
    var authEmailTextField = UITextField()
    var authPasswordView = UIView()
    var authPasswordLabel = UILabel()
    var authPasswordTextField = UITextField()
    var authLoginButton = UIButton()
    var authOrStackView = UIStackView()
    var authOtherView = UIView()
    var authGoogleView = UIView()
    var authFBView = UIView()
    
    var fillerView = UIView()
    
    //MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
    }

    //MARK: Functions
    
    func setupComponents(){
        view.backgroundColor = UIColor.white
        
        setupContentView()
        setupLaptopImage()
        setupWelcomeStackView()
        setupAuthView()
        setupAuthHeaderText()
        setupAuthDividerView()
        setupAuthFieldsStackView()
        setupAuthNameView()
        setupAuthEmailView()
        setupAuthPasswordView()
        setupLoginButton()
        setupOrLine()
        setupAuthOthersView()
        setupFillerView()
    }
    
    func setupContentView(){
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setupLaptopImage(){
        contentView.addSubview(laptopImage)
        laptopImage.translatesAutoresizingMaskIntoConstraints = false
        laptopImage.image = UIImage(named: "lockLaptop")
        
        NSLayoutConstraint.activate([
            laptopImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            laptopImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            laptopImage.widthAnchor.constraint(equalToConstant: 90),
            laptopImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupWelcomeStackView(){
        contentView.addSubview(welcomeStackView)
        welcomeStackView.translatesAutoresizingMaskIntoConstraints = false
        welcomeStackView.axis = .vertical
        welcomeStackView.spacing = 6
        NSLayoutConstraint.activate([
            welcomeStackView.topAnchor.constraint(equalTo: laptopImage.bottomAnchor, constant: 30),
            welcomeStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            welcomeStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
        
        let welcomeHeaderText = UILabel()
        welcomeStackView.addArrangedSubview(welcomeHeaderText)
        welcomeHeaderText.translatesAutoresizingMaskIntoConstraints = false
        welcomeHeaderText.text = "მოგესალმებით!"
        welcomeHeaderText.font = UIFont(name: myFont, size: 24)
        
        
        let welcomeParagraphText = UILabel()
        welcomeStackView.addArrangedSubview(welcomeParagraphText)
        welcomeParagraphText.translatesAutoresizingMaskIntoConstraints = false
        welcomeParagraphText.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        welcomeParagraphText.font = UIFont(name : myFont, size: 14)
        welcomeParagraphText.numberOfLines = 0
    }
    
    func setupAuthView(){
        contentView.addSubview(authView)
        authView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authView.topAnchor.constraint(equalTo: welcomeStackView.bottomAnchor, constant: 20),
        ])
    }
    
    func setupAuthHeaderText(){
        authView.addSubview(authHeaderText)
        authHeaderText.translatesAutoresizingMaskIntoConstraints = false
        authHeaderText.font = UIFont(name: myFont, size: 14)
        authHeaderText.font = UIFont.boldSystemFont(ofSize: 12)
        authHeaderText.text = "ავტორიზაცია"
        NSLayoutConstraint.activate([
            authHeaderText.heightAnchor.constraint(equalToConstant: 40),
            authHeaderText.centerXAnchor.constraint(equalTo: authView.centerXAnchor),
            authHeaderText.topAnchor.constraint(equalTo: authView.topAnchor)
        ])
    }
    
    func setupAuthDividerView(){
        authView.addSubview(authDividerView)
        authDividerView.translatesAutoresizingMaskIntoConstraints = false
        authDividerView.backgroundColor = UIColor.systemBlue
        NSLayoutConstraint.activate([
            authDividerView.topAnchor.constraint(equalTo: authHeaderText.bottomAnchor),
            authDividerView.heightAnchor.constraint(equalToConstant: 2),
            authDividerView.leadingAnchor.constraint(equalTo: authView.leadingAnchor),
            authDividerView.trailingAnchor.constraint(equalTo: authView.trailingAnchor),
        ])
    }
    
    func setupAuthFieldsStackView(){
        authView.addSubview(authFieldsStackView)
        authFieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        authFieldsStackView.axis = .vertical
        authFieldsStackView.distribution = .fillProportionally
        authFieldsStackView.spacing = 8
        
        NSLayoutConstraint.activate([
            authFieldsStackView.topAnchor.constraint(equalTo: authDividerView.bottomAnchor, constant: 24),
            authFieldsStackView.leadingAnchor.constraint(equalTo: authView.leadingAnchor),
            authFieldsStackView.trailingAnchor.constraint(equalTo: authView.trailingAnchor),
//            authFieldsStackView.bottomAnchor.constraint(equalTo: authView.bottomAnchor),
            authFieldsStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    func setupAuthNameView(){
        authFieldsStackView.addArrangedSubview(authNameView)
        authNameView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authNameView.leadingAnchor.constraint(equalTo: authFieldsStackView.leadingAnchor),
            authNameView.trailingAnchor.constraint(equalTo: authFieldsStackView.trailingAnchor),
        ])
        
        authNameView.addSubview(authNameLabel)
        authNameLabel.translatesAutoresizingMaskIntoConstraints = false
        authNameLabel.font = UIFont(name: myFont, size: 12)
        authNameLabel.text = "სრული სახელი"
        NSLayoutConstraint.activate([
            authNameLabel.topAnchor.constraint(equalTo: authNameView.topAnchor),
            authNameLabel.leadingAnchor.constraint(equalTo: authNameView.leadingAnchor),
            authNameLabel.trailingAnchor.constraint(equalTo: authNameView.trailingAnchor)
        ])
        
        authNameView.addSubview(authNameTextField)
        authNameTextField.translatesAutoresizingMaskIntoConstraints = false
        authNameTextField.font = UIFont(name: myFont, size: 12)
        authNameTextField.placeholder = "მაგ: ქეთინო ფერი"
        authNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        authNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        authNameTextField.layer.borderWidth = 1
        authNameTextField.layer.cornerRadius = 5
        authNameTextField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0) //padding 20
        NSLayoutConstraint.activate([
            authNameTextField.leadingAnchor.constraint(equalTo: authNameView.leadingAnchor),
            authNameTextField.trailingAnchor.constraint(equalTo: authNameView.trailingAnchor),
            authNameTextField.topAnchor.constraint(equalTo: authNameLabel.bottomAnchor, constant: 4),
        ])
    }

    func setupAuthEmailView(){
        authFieldsStackView.addArrangedSubview(authEmailView)
        authEmailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authEmailView.leadingAnchor.constraint(equalTo: authFieldsStackView.leadingAnchor),
            authEmailView.trailingAnchor.constraint(equalTo: authFieldsStackView.trailingAnchor),
        ])
        
        authEmailView.addSubview(authEmailLabel)
        authEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        authEmailLabel.font = UIFont(name: myFont, size: 12)
        authEmailLabel.text = "ელ. ფოსტა"
        NSLayoutConstraint.activate([
            authEmailLabel.topAnchor.constraint(equalTo: authEmailView.topAnchor),
            authEmailLabel.leadingAnchor.constraint(equalTo: authEmailView.leadingAnchor),
            authEmailLabel.trailingAnchor.constraint(equalTo: authEmailView.trailingAnchor)
        ])
        
        authEmailView.addSubview(authEmailTextField)
        authEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        authEmailTextField.font = UIFont(name: myFont, size: 12)
        authEmailTextField.placeholder = "მაგ: kusuna@mail.ru"
        authEmailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        authEmailTextField.layer.borderColor = UIColor.lightGray.cgColor
        authEmailTextField.layer.borderWidth = 1
        authEmailTextField.layer.cornerRadius = 5
        authEmailTextField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0) //padding 20
        NSLayoutConstraint.activate([
            authEmailTextField.leadingAnchor.constraint(equalTo: authEmailView.leadingAnchor),
            authEmailTextField.trailingAnchor.constraint(equalTo: authEmailView.trailingAnchor),
            authEmailTextField.topAnchor.constraint(equalTo: authEmailLabel.bottomAnchor, constant: 4),
        ])
    }
    
    func setupAuthPasswordView(){
        authFieldsStackView.addArrangedSubview(authPasswordView)
        authPasswordView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authPasswordView.leadingAnchor.constraint(equalTo: authFieldsStackView.leadingAnchor),
            authPasswordView.trailingAnchor.constraint(equalTo: authFieldsStackView.trailingAnchor),
        ])
        
        authPasswordView.addSubview(authPasswordLabel)
        authPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        authPasswordLabel.font = UIFont(name: myFont, size: 12)
        authPasswordLabel.text = "პაროლი"
        NSLayoutConstraint.activate([
            authPasswordLabel.topAnchor.constraint(equalTo: authPasswordView.topAnchor),
            authPasswordLabel.leadingAnchor.constraint(equalTo: authPasswordView.leadingAnchor),
            authPasswordLabel.trailingAnchor.constraint(equalTo: authPasswordView.trailingAnchor)
        ])
        
        authPasswordView.addSubview(authPasswordTextField)
        authPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        authPasswordTextField.font = UIFont(name: myFont, size: 12)
        authPasswordTextField.placeholder = "მაგ: busuna123"
        authPasswordTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        authPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
        authPasswordTextField.layer.borderWidth = 1
        authPasswordTextField.layer.cornerRadius = 5
        authPasswordTextField.isSecureTextEntry = true
        authPasswordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(20, 0, 0) //padding 20
        NSLayoutConstraint.activate([
            authPasswordTextField.leadingAnchor.constraint(equalTo: authPasswordView.leadingAnchor),
            authPasswordTextField.trailingAnchor.constraint(equalTo: authPasswordView.trailingAnchor),
            authPasswordTextField.topAnchor.constraint(equalTo: authPasswordLabel.bottomAnchor, constant: 4),
        ])
    }
    
    func setupLoginButton(){
        authView.addSubview(authLoginButton)
        authLoginButton.translatesAutoresizingMaskIntoConstraints = false
        authLoginButton.setTitle("შესვლა", for: .normal)
        authLoginButton.backgroundColor = UIColor.systemBlue
        authLoginButton.layer.cornerRadius = 10
        authLoginButton.layer.borderWidth = 1
        authLoginButton.layer.borderColor = UIColor.systemBlue.cgColor
        authLoginButton.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            authLoginButton.leadingAnchor.constraint(equalTo: authView.leadingAnchor),
            authLoginButton.trailingAnchor.constraint(equalTo: authView.trailingAnchor),
            authLoginButton.heightAnchor.constraint(equalToConstant: 46),
            authLoginButton.topAnchor.constraint(equalTo: authFieldsStackView.bottomAnchor, constant: 16)
        ])
        
        authLoginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)

    }
    
    func setupOrLine() {
        let orLabel = UILabel()
        orLabel.text = "ან"
        orLabel.font = UIFont(name: myFont, size: 15)
        
        let orLine1 = UIView()
        orLine1.backgroundColor = .gray
        orLine1.translatesAutoresizingMaskIntoConstraints = false
        orLine1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let orLine2 = UIView()
        orLine2.backgroundColor = .gray
        orLine2.translatesAutoresizingMaskIntoConstraints = false
        orLine2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        authOrStackView = UIStackView(arrangedSubviews: [orLine1, orLabel, orLine2])
        authOrStackView.axis = .horizontal
        authOrStackView.alignment = .center
        authOrStackView.distribution = .fill
        authOrStackView.spacing = 8
        
        authView.addSubview(authOrStackView)
        authOrStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authOrStackView.leadingAnchor.constraint(equalTo: authView.leadingAnchor),
            authOrStackView.trailingAnchor.constraint(equalTo: authView.trailingAnchor),
            authOrStackView.topAnchor.constraint(equalTo: authLoginButton.bottomAnchor, constant: 16),
            authOrStackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let line1WidthConstraint = orLine1.widthAnchor.constraint(equalTo: orLine2.widthAnchor)
        line1WidthConstraint.priority = UILayoutPriority(500)
        line1WidthConstraint.isActive = true

    }
    
    func setupAuthOthersView(){
        authView.addSubview(authOtherView)
        authOtherView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authOtherView.topAnchor.constraint(equalTo: authOrStackView.bottomAnchor, constant: 16),
            authOtherView.leftAnchor.constraint(equalTo: authView.leftAnchor),
            authOtherView.rightAnchor.constraint(equalTo: authView.rightAnchor),
            authOtherView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        setupGoogleView()
        setupFBView()
        
        NSLayoutConstraint.activate([
            authGoogleView.leadingAnchor.constraint(equalTo: authOtherView.leadingAnchor),
            authGoogleView.trailingAnchor.constraint(equalTo: authOtherView.trailingAnchor),
            authGoogleView.centerXAnchor.constraint(equalTo: authOtherView.centerXAnchor),
            authGoogleView.topAnchor.constraint(equalTo: authOtherView.topAnchor),
            authGoogleView.heightAnchor.constraint(equalToConstant: 48),
            
            authFBView.leadingAnchor.constraint(equalTo: authOtherView.leadingAnchor),
            authFBView.trailingAnchor.constraint(equalTo: authOtherView.trailingAnchor),
            authFBView.centerXAnchor.constraint(equalTo: authOtherView.centerXAnchor),
            authFBView.topAnchor.constraint(equalTo: authGoogleView.bottomAnchor, constant: 12),
            authFBView.heightAnchor.constraint(equalToConstant: 48),
        ])
        
        authGoogleView.backgroundColor = UIColor.systemGray5
        authFBView.backgroundColor = UIColor.systemGray5
        
        authGoogleView.layer.cornerRadius = 10
        authGoogleView.layer.borderWidth = 1
        authGoogleView.layer.borderColor = UIColor.systemGray5.cgColor
        authGoogleView.layer.masksToBounds = true
        
        authFBView.layer.cornerRadius = 10
        authFBView.layer.borderWidth = 1
        authFBView.layer.borderColor = UIColor.systemGray5.cgColor
        authFBView.layer.masksToBounds = true
    }
    
    func setupGoogleView(){
            
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        let logoConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium)
        logoImageView.image = UIImage(systemName: "g.circle.fill", withConfiguration: logoConfig)
        logoImageView.tintColor = UIColor.black
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.text = "Googol"
        textLabel.font = UIFont.systemFont(ofSize: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [logoImageView, textLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        authGoogleView.addSubview(stackView)
        
        authOtherView.addSubview(authGoogleView)
        authGoogleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            stackView.centerXAnchor.constraint(equalTo: authOtherView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: authGoogleView.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    func setupFBView(){
        
        let logoImageView = UIImageView()
        logoImageView.contentMode = .scaleAspectFit
        let logoConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular, scale: .medium)
        logoImageView.image = UIImage(systemName: "f.circle.fill", withConfiguration: logoConfig)
        logoImageView.tintColor = UIColor.black
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.text = "Seisburng"
        textLabel.font = UIFont.systemFont(ofSize: 18)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [logoImageView, textLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        authFBView.addSubview(stackView)
        
        authOtherView.addSubview(authFBView)
        authFBView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            stackView.centerXAnchor.constraint(equalTo: authOtherView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: authFBView.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupFillerView(){
        contentView.addSubview(fillerView)
        fillerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fillerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            fillerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fillerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fillerView.topAnchor.constraint(equalTo: authView.bottomAnchor),
            fillerView.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    
    @objc func loginPressed() {
        guard let email = authEmailTextField.text, isValidEmail(email) else {
            authEmailTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        guard let password = authPasswordTextField.text, password.count >= 6, password.count <= 15 else {
            authPasswordTextField.layer.borderColor = UIColor.red.cgColor
            return
        }
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

//#Preview {
//    ViewController()
//}


//
//  LoginPageVC.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 26.04.24.
//


import UIKit


class LoginPageVC: UIViewController {
    
    // MARK: - Variables
    
    var viewModel = LoginPageViewModel()
    
    // MARK: - UI Components
    
    let imageButtonView: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 66
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor(named: "customBackground")
        button.clipsToBounds = true
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let personImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        image.tintColor = .label
        return image
    }()
    
    let plusImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .label
        return image
    }()
    
    let inputsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var password2TextField: UITextField!
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("დარეგისტრირება", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 23
        return button
    }()
    
    let autoLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ავტომატური შესვლა", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 23
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ექაუნთის წაშლა", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 23
        button.isHidden = true
        return button
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "გამარჯობა"
        label.font = label.font.withSize(24)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let navigateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ნახე ქვეყნები", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 23
        button.isHidden = true
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    
    // MARK: - UI Setup
    
    func setupLayout() {
        view.backgroundColor = UIColor(named: "customBackground")
        
        view.addSubview(imageButtonView)
        imageButtonView.addSubview(personImageView)
        view.addSubview(inputsStackView)
        view.addSubview(registerButton)
        view.addSubview(autoLoginButton)
        view.addSubview(deleteButton)
        view.addSubview(helloLabel)
        view.addSubview(navigateButton)
        
        imageButtonView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        inputsStackView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        autoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        
        let (nameView, textField) = UIView.createCustomInputView(titleLabel: "მომხმარებლის სახელი", inputPlaceholder: "შეიყვანეთ მომხმარებლის სახელი")
        nameTextField = textField
        inputsStackView.addArrangedSubview(nameView)
        
        let (passwordView, passwordField) = UIView.createCustomInputView(titleLabel: "პაროლი", inputPlaceholder: "შეიყვანეთ პაროლი", isPassword: true)
        passwordTextField = passwordField
        inputsStackView.addArrangedSubview(passwordView)
        
        let (password2View, password2Field) = UIView.createCustomInputView(titleLabel: "გაიმეორეთ პაროლი", inputPlaceholder: "განმეორებით შეიყვანეთ პაროლი", isPassword: true)
        password2TextField = password2Field
        inputsStackView.addArrangedSubview(password2View)
        
        NSLayoutConstraint.activate([
            imageButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButtonView.heightAnchor.constraint(equalToConstant: 132),
            imageButtonView.widthAnchor.constraint(equalToConstant: 132),
            imageButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            
            personImageView.centerXAnchor.constraint(equalTo: imageButtonView.centerXAnchor, constant: -3),
            personImageView.centerYAnchor.constraint(equalTo: imageButtonView.centerYAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 80),
            personImageView.widthAnchor.constraint(equalToConstant: 80),
            
            inputsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputsStackView.topAnchor.constraint(equalTo: imageButtonView.bottomAnchor, constant: 46),
            inputsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            inputsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.topAnchor.constraint(equalTo: inputsStackView.bottomAnchor, constant: 50),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            
            autoLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autoLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            autoLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            autoLoginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25),
            autoLoginButton.heightAnchor.constraint(equalToConstant: 46),
            
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            deleteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            deleteButton.topAnchor.constraint(equalTo: autoLoginButton.bottomAnchor, constant: 25),
            deleteButton.heightAnchor.constraint(equalToConstant: 46),
            
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            helloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            helloLabel.topAnchor.constraint(equalTo: imageButtonView.bottomAnchor, constant: 100),
            
            navigateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            navigateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            navigateButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 25),
            navigateButton.heightAnchor.constraint(equalToConstant: 46),
            
        ])
    }
    
    func setupData() {
        updateBorderColor()
        
        imageButtonView.addAction(UIAction(handler: { _ in
            self.openGallery()
        }), for: .touchUpInside)
        
        registerButton.addAction(UIAction(handler: { _ in
            self.registerButtonClicker()
        }), for: .touchUpInside)
        
        autoLoginButton.addAction(UIAction(handler: { _ in
            self.autoLoginButtonClicked()
        }), for: .touchUpInside)
        
        deleteButton.addAction(UIAction(handler: { _ in
            self.deleteButtonClicked()
        }), for: .touchUpInside)
        
        navigateButton.addAction(UIAction(handler: { _ in
            self.navigateButtonClicked()
        }), for: .touchUpInside)
    }
    
    
    // MARK: - Helper Functions
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection) //deprecated
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBorderColor()
        }
    }
    
    func updateBorderColor() {
        if traitCollection.userInterfaceStyle == .dark {
            imageButtonView.layer.borderColor = UIColor.white.cgColor
        } else {
            imageButtonView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func registerButtonClicker() {
        if viewModel.userHasLoggedIn {
            userLoggedOut()
        } else {
            handleLogin()
        }
    }
    
    func autoLoginButtonClicked() {
        if viewModel.userHasLoggedIn {
            viewModel.openSyllabus()
        } else {
            do {
                let credentials = try viewModel.loadCredentials()
                userLoggedIn(username: credentials.username)
            } catch {
                print("Cant Login")
                
                displayAlert(message: "თქვენი მონაცემები არ არის შენახული", title: "არ გამოვა მასე")
            }
        }
    }
    
    func deleteButtonClicked() {
        do {
            try viewModel.deleteCredentials()
            displayAlert(message: "თქვენი მონაცემები წარმატებით წაიშალა", title: "გილოცავთ")
            deleteImage()
            userLoggedOut()
            print("Deleted")
        } catch {
            print("Cant Delete")
        }
    }
    
    func navigateButtonClicked() {
        let landingPageVC = LandingPageVC()
        navigationController?.pushViewController(landingPageVC, animated: true)
    }
    
    func handleLogin() {
        guard let username = nameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let repeatedPassword = password2TextField.text, !repeatedPassword.isEmpty else {
            displayAlert(message: "შეავსეთ ყველა ფილდი", title: "არ გამოვა მასე")
            return
        }
        
        guard password == repeatedPassword else {
            displayAlert(message: "პაროლები არ ემთხვევა", title: "არ გამოვა მასე")
            return
        }
        
        guard password.count >= 8 else {
            displayAlert(message: "პაროლი უნდა მოიცავდეს მინიმუმ 8 სიმბოლოს", title: "არ გამოვა მასე")
            return
        }
        
        do {
            try viewModel.saveCredentials(username: username, password: password)
            userLoggedIn(username: username)
            if viewModel.isFirstLogin() {
                displayAlert(message: "ეს არის თქვენი პირველი შემოსვლა ჩვენს აპლიკაციაში და ამიტომ დასაჩუქრდებით 15 ფრისპინით", title: "მოგესალმებით")
            }
        } catch {
            displayAlert(message: "უკვე დარეგისტრირებული ხარ ბრო", title: "არ გამოვა მასე")
        }
    }
    
    
    func displayAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "კაი ჩემო ძმაო", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    // aqaurobis optimizacia rogor iqneba yvelaze sworad?
    //                      VVV
    
    func userLoggedIn(username: String){
        viewModel.userHasLoggedIn = true
        inputsStackView.isHidden = true
        helloLabel.isHidden = false
        helloLabel.text = "გამარჯობა \(username)"
        autoLoginButton.setTitle("სილაბუსი", for: .normal)
        registerButton.setTitle("ანგარიშიდან გამოსვლა", for: .normal)
        deleteButton.isHidden = false
        navigateButton.isHidden = false
        loadImage()
    }
    
    func userLoggedOut(){
        nameTextField.text = ""
        passwordTextField.text = ""
        password2TextField.text = ""
        viewModel.userHasLoggedIn = false
        inputsStackView.isHidden = false
        helloLabel.isHidden = true
        helloLabel.text = ""
        autoLoginButton.setTitle("ავტომატური შესვლა", for: .normal)
        registerButton.setTitle("რეგისტრაცია", for: .normal)
        deleteButton.isHidden = true
        imageButtonView.setImage(nil, for: .normal)
        personImageView.isHidden = false
        navigateButton.isHidden = true
    }
    
    func loadImage() {
        let fileURL = viewModel.getDocumentsDirectory().appendingPathComponent("user.png")
        if let imageData = try? Data(contentsOf: fileURL),
           let image = UIImage(data: imageData) {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
        }
    }

}


// MARK: Gallery Extension

extension LoginPageVC:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func openGallery(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
            if viewModel.userHasLoggedIn || viewModel.isFirstLogin() {
                viewModel.saveImage(image: image)
            }
        } else if let image = info[.originalImage] as? UIImage {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
            if viewModel.userHasLoggedIn || viewModel.isFirstLogin() {
                viewModel.saveImage(image: image)
            }
        }
        
        dismiss(animated: true)
    }
    
    func deleteImage() {
        let fileURL = viewModel.getDocumentsDirectory().appendingPathComponent("user.png")
        do {
            try FileManager.default.removeItem(at: fileURL)
            imageButtonView.setImage(nil, for: .normal)
            personImageView.isHidden = false
        } catch let error {
            print("Error deleting image: \(error)")
        }
    }
}

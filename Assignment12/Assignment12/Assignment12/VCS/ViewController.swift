//
//  ViewController.swift
//  Assignment12
//
//  Created by Akaki Titberidze on 10.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    var backColor: UIColor?
    
    let mainTitle: UILabel = {
        let title = UILabel()
        title.text = "მიშა ცაგარელის ჰაბი"
        title.font = title.font.withSize(24)
        title.textColor = .white
        
        return title
    }()
    
    let descriptionTitle: UILabel = {
        let title = UILabel()
        title.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        title.numberOfLines = 0
        title.font = title.font.withSize(16)
        title.textColor = UIColor(named: "TintWhite")
        return title
    }()
    
    let searchTitle: UILabel = {
        let title = UILabel()
        title.text = "ზოდიაქოს სახელი"
        title.font = title.font.withSize(12)
        title.textColor = .white
        return title
    }()
    
    let searchInput: UITextField = {
        let input = UITextField()
        input.borderStyle = .roundedRect
        input.backgroundColor = .clear
        input.layer.borderColor = UIColor.white.cgColor
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 5
        input.textColor = .white
        input.attributedPlaceholder = NSAttributedString(
            string: "მაგ: ქალწული",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        return input
    }()
    
    let searchButton = UIButton.customizedButton(customColor: .purple, text: "შემდეგ")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
        searchButton.addTarget(self, action: #selector(goToSignVC), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let backColor = backColor {
            view.backgroundColor = backColor
        }
    }
    
    @objc func goToSignVC(){
        guard let searchText = searchInput.text else { return }
        
        if let matchingZodiac = zodiacs.first(where: { $0.sign.rawValue == searchText}) {
            let signVC = SignViewController()
            signVC.zodiacInfo = matchingZodiac
            navigationController?.pushViewController(signVC, animated: true)
        } else {
            alert(title: "არასწორი ინფუთი", message: "გთხოვთ შეიყვანოთ ზოდიაქოს სახელი ქართულად, ოღონდ სწორად. <3")
        }
    }
    
    func alert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "კაი ძმაო", style: .default)
        
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController {
    func style() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "mainBackground")!)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        searchTitle.translatesAutoresizingMaskIntoConstraints = false
        searchInput.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        view.addSubview(mainTitle)
        view.addSubview(descriptionTitle)
        view.addSubview(searchTitle)
        view.addSubview(searchInput)
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            descriptionTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 20),
            descriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            descriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            searchTitle.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 90),
            searchTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            searchInput.topAnchor.constraint(equalTo: searchTitle.bottomAnchor, constant: 4),
            searchInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchInput.heightAnchor.constraint(equalToConstant: 44),
            
            searchButton.topAnchor.constraint(equalTo: searchInput.bottomAnchor, constant: 24),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
}




#Preview {
    ViewController()
}

//
//  InfoViewController.swift
//  Assignment13
//
//  Created by Akaki Titberidze on 13.04.24.
//

import UIKit

class InfoViewController: UIViewController{
    // MARK: Variables
    var student: StudentInformation?
    var topView = UIView()
    var topImage = UIImageView()
    var topLabel = UILabel()
    var infoTuple: [(key: String, value: String)] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setupUI()
        setupData()
    }
    
    func setupData(){
        topImage.image = student?.profileImage
        topLabel.text = student?.fullName.capitalized
        infoTuple = [
            ("Gender:", student?.gender.rawValue ?? "Default"),
            ("Age (years):", String(student?.age ?? 20)),
            ("Hobby:", student?.hobby ?? "Default"),
            ("Fav Emoji:", student?.randomEmoji ?? "🥲"),
            ("Email:", student?.email ?? "Default"),
            ("Geolocation:", student?.geoLocation ?? "Default"),
            ("Coding(mth):", student?.codingMonths ?? "Default"),
            ("Fav Number:", student?.favNumb ?? "Default"),
        ]
    }
    
    func setupUI(){
        view.backgroundColor = UIColor(named: "defBackColor")
        view.addSubview(topView)
        topView.addSubview(topImage)
        topView.addSubview(topLabel)
        view.addSubview(tableView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topImage.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 364),
            
            topImage.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 20),
            topImage.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topImage.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.5),
            topImage.heightAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.5),
            
            topLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            topLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16),
            
            tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
        ])
        
        topView.backgroundColor = UIColor(named: "defGrayColor")
        topImage.clipsToBounds = true
        topImage.layer.cornerRadius = 80
        topImage.layer.masksToBounds = true
        
        topLabel.textAlignment = .center
        topLabel.textColor = .white
        topLabel.font = topLabel.font.withSize(22)
        
        tableView.layer.cornerRadius = 20
    }
}
// MARK: TableView
extension InfoViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoTuple.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { fatalError("The TableView could not dequeue a CustomCell in ViewController.") }
        
        let key = infoTuple[indexPath.row].0
        let value = infoTuple[indexPath.row].1
        
        cell.configure(with: key, and: value)
        
        return cell
    }
}

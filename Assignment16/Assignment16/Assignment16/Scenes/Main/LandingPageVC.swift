//
//  LandingPageVC.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 21.04.24.
//

import UIKit

class LandingPageVC: UIViewController {
    
    var countries = [CountryModel]()
    
    let countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
        fetchData()
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(countriesTableView)
        
        countriesTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countriesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            countriesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            countriesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countriesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    func setupData() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Countries"
        
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }
    
    func fetchData() {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Client error: \(error.localizedDescription)")
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode),
                let data = data else {
                print("Server error")
                return
            }
            
            do {
                var countryData = try JSONDecoder().decode([CountryModel].self, from: data)
                
                countryData.sort {
                    if $0.name.common == "Georgia" {
                        return true
                    } else if $1.name.common == "Georgia" {
                        return false
                    }
                    return $0.name.common! < $1.name.common!
                }
                
                DispatchQueue.main.async {
                    self.countries = countryData
                    self.countriesTableView.reloadData()
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

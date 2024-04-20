//
//  MainView.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 19.04.24.
//
import Foundation
import UIKit

class MainView: UIViewController {
    
    var news = [NewsModel]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
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
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupData() {
        self.title = "Panicka News"
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func fetchData() {
        guard let url = URL(string: "https://imedinews.ge/api/categorysidebarnews/get") else { return }
        
        
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Client error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode), let data = data else {
                print("Server error")
                return
            }
            
            do {
                let wrapper = try JSONDecoder().decode(ListWrapper.self, from: data)
                DispatchQueue.main.async {
                    self.news = wrapper.list
                    self.tableView.reloadData()
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }.resume()
    }
}


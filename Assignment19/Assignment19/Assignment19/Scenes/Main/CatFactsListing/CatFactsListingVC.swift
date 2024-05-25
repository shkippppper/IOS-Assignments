//
//  ViewController.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 02.05.24.
//

import UIKit

class CatFactsListingVC: UIViewController {
    
    // MARK: - Variables
    
    var viewModel: CatFactsListingViewModel
    
    // MARK: - UI Components
    
    var factTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(CatFactCell.self, forCellReuseIdentifier: "CatFactCell")
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: CatFactsListingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        setupLayout()
        setupData()
    }
    
    // MARK: - UI Setup
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(factTableView)
        
        factTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            factTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            factTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            factTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            factTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
    }
    
    func setupData() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Cat Facts"
        factTableView.dataSource = self
        factTableView.delegate = self
        
        viewModel.reloadData = { [weak self] in
            self?.factTableView.reloadData()
        }
    }
}


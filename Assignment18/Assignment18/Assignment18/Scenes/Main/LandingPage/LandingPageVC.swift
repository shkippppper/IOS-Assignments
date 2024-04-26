//
//  LandingPageVC.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 21.04.24.
//

import UIKit

protocol LandingPageViewModelDelegate: AnyObject {
    func didFetchCountries(countries: [CountryModel])
}

class LandingPageVC: UIViewController, UISearchResultsUpdating {
    
    
    // MARK: - Variables
    
    var viewModel = LandingPageViewModel()
    
    // MARK: - UI Components
    
    var searchController: UISearchController!
    
    let countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "customBackground")
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupLayout()
        setupData()
        setupViewModel()
    }
    
    // MARK: - UI Setup
    
    func setupViewModel() {
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    func setupLayout() {
        view.backgroundColor = UIColor(named: "customBackground")
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
    
    func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    
    // MARK: - Helper Functions
    
    func updateSearchResults(for searchController: UISearchController) { //chqara tu wer icrasheba, rato?
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            viewModel.filterCountries(searchText)
        } else {
            viewModel.resetFilter()
        }
    }
}

extension LandingPageVC: LandingPageViewModelDelegate {
    func didFetchCountries(countries: [CountryModel]) {
        countriesTableView.reloadData()
    }
}

//
//  DetailedCountryVC.swift
//  Assignment18
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit



class DetailedCountryVC: UIViewController, UsefulLinksViewDelegate {
        
    
    // MARK: - Variables
    
    var viewModel: DetailedCountryViewModel
    
    // MARK: - UI Components
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(named: "customBackground")
        return scrollView
    }()
    
    let horizontalLineView1: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    let horizontalLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    let contentView = UIView()
    
    let flagView = FlagView()
    let basicInfoView = BasicInfoView()
    let usefulLinksView = UsefulLinksView()
    
    // MARK: - Lifecycle
    
    init(viewModel: DetailedCountryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    // MARK: - UI Setup
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(flagView)
        contentView.addSubview(horizontalLineView1)
        contentView.addSubview(basicInfoView)
        contentView.addSubview(horizontalLineView2)
        contentView.addSubview(usefulLinksView)
        
        flagView.translatesAutoresizingMaskIntoConstraints = false
        basicInfoView.translatesAutoresizingMaskIntoConstraints = false
        usefulLinksView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            flagView.topAnchor.constraint(equalTo: contentView.topAnchor),
            flagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            flagView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            horizontalLineView1.topAnchor.constraint(equalTo: flagView.bottomAnchor, constant: 10),
            horizontalLineView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            horizontalLineView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            basicInfoView.topAnchor.constraint(equalTo: horizontalLineView1.bottomAnchor, constant: 10),
            basicInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            horizontalLineView2.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 10),
            horizontalLineView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            horizontalLineView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            usefulLinksView.topAnchor.constraint(equalTo: horizontalLineView2.bottomAnchor, constant: 10),
            usefulLinksView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usefulLinksView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            usefulLinksView.heightAnchor.constraint(equalToConstant: 130),
            usefulLinksView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
        
    }

    func setupData(){
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = viewModel.country.name.common
    
        usefulLinksView.delegate = self
        
        viewModel.fetchImage { [weak self] image in
            self?.flagView.configure(
                image: image ?? UIImage(named: "tempImage")!,
                altInfo: self?.viewModel.country.flags.alt ?? "No data"
            )
        }
        
        basicInfoView.configure(
            name: viewModel.country.name.common ?? "",
            officialName: viewModel.country.name.official ?? "",
            population: viewModel.country.population?.description ?? "",
            independent: viewModel.country.independent?.description ?? "",
            region: viewModel.country.region ?? "Unknown",
            subregion: viewModel.country.subregion ?? "Unknown",
            startOfWeek: viewModel.country.startOfWeek ?? "Unknown",
            flag: viewModel.country.flag ?? "",
            unMember: viewModel.country.unMember?.description ?? ""
        )
    }
    
    
    // MARK: - Helper Functions
    
    func didTapStreetMap() {
        viewModel.didClickStreetMap()
    }
    
    func didTapGoogleMap() {
        viewModel.didClickGoogleMap()
    }
}

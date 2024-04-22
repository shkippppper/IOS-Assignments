//
//  DetailedCountryVC.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 22.04.24.
//

import UIKit

class DetailedCountryVC: UIViewController {
    
    var countryData: CountryModel?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let contentView = UIView()
    
    let flagView = FlagView()
    let basicInfoView = BasicInfoView()
    let usefulLinksView = UsefulLinksView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(flagView)
        contentView.addSubview(basicInfoView)
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
            
            basicInfoView.topAnchor.constraint(equalTo: flagView.bottomAnchor, constant: 20),
            basicInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            basicInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            usefulLinksView.topAnchor.constraint(equalTo: basicInfoView.bottomAnchor, constant: 20),
            usefulLinksView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            usefulLinksView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            usefulLinksView.heightAnchor.constraint(equalToConstant: 130),
            usefulLinksView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        

    }
    
    func setupData(){
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = countryData?.name.common
        
        flagView.configure(imageUrl: countryData?.flags.png ?? "tempImage", altInfo: countryData?.flags.alt ?? "No data available")
        basicInfoView.configure(
            name: countryData?.name.common ?? "",
            officialName: countryData?.name.official ?? "",
            population: stringify(data: countryData?.population ?? ""),
            independent: stringify(data: countryData?.independent ?? ""),
            region: countryData?.region ?? "Unknown",
            subregion: countryData?.subregion ?? "Unknown",
            startOfWeek: countryData?.startOfWeek ?? "Unknown",
            flag: countryData?.flag ?? "",
            unMember: stringify(data: countryData?.unMember ?? "")
        )
        usefulLinksView.configure(streetMapUrl: countryData?.maps.openStreetMaps ?? "", googleMapUrl: countryData?.maps.googleMaps ?? "")
    }
    
    func stringify(data: Any) -> String{
        "\(data)"
    }
}

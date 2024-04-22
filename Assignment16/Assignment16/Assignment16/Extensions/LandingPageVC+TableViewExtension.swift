//
//  LandingPageVC+TableViewExtension.swift
//  Assignment16
//
//  Created by Akaki Titberidze on 21.04.24.
//

import UIKit

extension LandingPageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else { fatalError("cant get CountryCell") }
        
        cell.selectionStyle = .none
        
        cell.configure(imageUrl: countries[indexPath.row].flags.png!, countryName: countries[indexPath.row].name.common!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = DetailedCountryVC()
        detailedVC.countryData = countries[indexPath.row]
        navigationController?.pushViewController(detailedVC, animated: true)
    }
    
}

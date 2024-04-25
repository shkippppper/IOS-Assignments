//
//  LandingPageVC+TableViewExtension.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 21.04.24.
//

import UIKit

extension LandingPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCountries()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell else { fatalError("cant get CountryCell") }
        cell.selectionStyle = .none
        
        viewModel.fetchImage(urlString: viewModel.country(at: indexPath.row).flags.png) { [weak self] image in
            cell.configure(
                image: image ?? UIImage(named: "tempImage")!,
                altInfo: self?.viewModel.country(at: indexPath.row).name.common ?? "No Name"
            )
        }

        return cell
    }
}

extension LandingPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedCountryViewModel = DetailedCountryViewModel(country: viewModel.country(at: indexPath.row))
        let detailedVC = DetailedCountryVC(viewModel: detailedCountryViewModel)
        navigationController?.pushViewController(detailedVC, animated: true)
    }
}

//
//  LandingPageViewModel.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 25.04.24.
//

import UIKit

class LandingPageViewModel {
    
    private var countries = [CountryModel]()
    private var filteredCountries = [CountryModel]()
    var isFiltering: Bool = false
    
    let urlString = "https://restcountries.com/v3.1/all"
    
    
    weak var delegate: LandingPageViewModelDelegate?
    
    func fetchData() {
        fetchCountries()
    }
    
    private func fetchCountries() {
        NetworkManager.shared.fetchData(urlString: urlString) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let countries):
                    let sortedCountries = self!.sortCountries(countries: countries)
                    self?.countries = sortedCountries
                    self?.delegate?.didFetchCountries(countries: sortedCountries)
                case .failure(_):
                    print("error fetching")
                }
            }
        }
    }
    
    
    func fetchImage(urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(UIImage(named: "tempImage"))
            return
        }
        
        NetworkManager.shared.fetchImage(url: url, completion: completion)
    }
    
    func sortCountries(countries: [CountryModel]) -> [CountryModel] {
        return countries.sorted {
            if $0.name.common == "Georgia" {
                return true
            } else if $1.name.common == "Georgia" {
                return false
            }
            return $0.name.common! < $1.name.common!
        }
    }
    
    func numberOfCountries() -> Int {
        return isFiltering ? filteredCountries.count : countries.count
    }
    
    func country(at index: Int) -> CountryModel {
        return isFiltering ? filteredCountries[index] : countries[index]
    }
    
    func filterCountries(_ searchText: String) {
        filteredCountries = countries.filter { country in
            return country.name.common?.lowercased().contains(searchText.lowercased()) ?? false
        }
        isFiltering = true
        delegate?.didFetchCountries(countries: filteredCountries)
    }
    
    func resetFilter() {
        isFiltering = false
        delegate?.didFetchCountries(countries: countries)
    }
    
}

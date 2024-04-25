//
//  DetailedCountryViewModel.swift
//  Assignment17
//
//  Created by Akaki Titberidze on 25.04.24.
//

import UIKit

class DetailedCountryViewModel {
    
    var country: CountryModel
    
    init(country: CountryModel) {
        self.country = country
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        guard let urlString = country.flags.png, let url = URL(string: urlString) else {
            completion(UIImage(named: "tempImage"))
            return
        }
        
        NetworkManager.shared.fetchImage(url: url, completion: completion)
    }
    
    func didClickStreetMap(){
        self.openLink(link: self.country.maps.openStreetMaps ?? "")
    }
    
    func didClickGoogleMap(){
        self.openLink(link: self.country.maps.googleMaps ?? "")
    }
    
    func openLink(link: String){
        if let url = URL(string: link){
            UIApplication.shared.open(url)
        }
    }
}

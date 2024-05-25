//
//  CatFactsListingViewModel.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 03.05.24.
//

import Foundation
import NetworkingPackage

class CatFactsListingViewModel {
    
    // MARK: - Variables
    let factsUrl = "https://catfact.ninja/facts"
    var facts: FactsModel?
    var reloadData: (() -> Void)?
    var numberOfItems: Int = 0
    var isFetching = false
    var firstSet = true
    
    // MARK: - Initialiser
    
    func viewLoaded(){
        self.fetchAllData()
    }
    
    // MARK: - Helper Functions
    
    func fetchAllData() {
        fetchFactData(url: factsUrl)
    }
    
    func fetchFactData(url: String){
        if isFetching {
            return
        }
        isFetching = true
        
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(FactsModel.self, from: data)
        } completion: { result in
            switch result {
            case .success(let facts):
                if let facts = facts {
                    DispatchQueue.main.async {
                        if self.firstSet {
                            self.facts = facts
                            self.firstSet = false
                        } else {
                            self.facts?.next_page_url = facts.next_page_url
                            self.facts?.data.append(contentsOf: facts.data)
                        }
                        self.numberOfItems += facts.data.count
                        self.reloadData?()
                        self.isFetching = false
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateCellData(row: Int){
        if row + 3 > self.numberOfItems {
            guard let url = self.facts?.next_page_url else{
                return
            }
            fetchFactData(url: url)
        }
    }
    
    // MARK: - Computed Properties
    
    func factCount() -> Int {
        self.numberOfItems
    }
    
    func factData() -> [Fact]? {
        self.facts?.data
    }
}

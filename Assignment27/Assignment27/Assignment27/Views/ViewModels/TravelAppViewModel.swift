//
//  TravelAppViewModel.swift
//  Assignment27
//
//  Created by Akaki Titberidze on 29.05.24.
//

import Foundation
import NetworkingPackage

class TravelAppViewModel: ObservableObject {
    
    @Published var travelData: TravelData?
    @Published var showTravelTip = false
    @Published var travelTip: String?
    
    let mockUrl = "https://mocki.io/v1/f0e94242-969f-431f-b51e-3e29f1ac2097"
    
    init() {
        loadItems()
    }
    
    
    func loadItems() {
        fetchTravelData(url: mockUrl)
    }
    
    func fetchTravelData(url: String){
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(TravelData.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    self.travelData = info
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showRandomTip() {
        if let tips = travelData?.travel_tips {
            travelTip = tips.randomElement()
            showTravelTip = true
        }
    }
    
    func getTravelData() -> TravelData? {
        travelData
    }
    
}

//
//  DetailedViewModel.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 09.05.24.
//

import Foundation

class DetailedViewModel {
    
    // MARK: - Variables
    
    var imageData = [UnsplashImageModel]()
    var imageIndex = 0
    
    // MARK: - Helper Functions
    
    // MARK: - Computed Properties
    
    func getImageCount() -> Int {
        imageData.count
    }
    
    func getImageData() -> [UnsplashImageModel] {
        imageData
    }
    
    func getImageIndex() -> Int {
        imageIndex
    }
    
    

    

    
}

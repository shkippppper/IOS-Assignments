//
//  GalleryViewModel.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 08.05.24.
//

import Foundation
import NetworkingPackage

final class GalleryViewModel {
    
    // MARK: - Variables
    private var imageData = [UnsplashImageModel]()
    private var url = URLData().url
    var reloadData: (() -> Void)?
    
    
    // MARK: - Initialiser
    func viewLoaded() {
        fetchImageData()
    }
    
    // MARK: - Helper Functions
    
    private func fetchImageData() {
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode([UnsplashImageModel].self, from: data)
        } completion: { [weak self] result in
            switch result {
            case .success(let imageInfo):
                if let imageInfo = imageInfo {
                    DispatchQueue.main.async {
                        self?.imageData = imageInfo
                        self?.reloadData?()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Computed Properties
    
    func getImageCount() -> Int {
        imageData.count
    }
    
    func getImageData() -> [UnsplashImageModel] {
        imageData
    }
    
}

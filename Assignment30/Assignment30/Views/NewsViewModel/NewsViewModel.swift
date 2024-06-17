//
//  NewsViewModel.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import Foundation

import SwiftUI
import NetworkingPackage

final class NewsViewModel: ObservableObject {
    @Published var news: [SingleNews] = []
    let newsApiUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=1e838950a56541a5b62b8c1bd5065b54"
    
    init() {
        fetchNews(url: newsApiUrl)
    }
    
    private func fetchNews(url: String) {
        NetworkingPackage().fetchData(url: URL(string: url)!) { data in
            return try! JSONDecoder().decode(News.self, from: data)
        } completion: { result in
            switch result {
            case .success(let info):
                if let info = info {
                    DispatchQueue.main.async{
                        self.news = info.articles
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func convertDateToLongString(dateString: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        guard let date = formatter.date(from: dateString) else {
            return nil
        }
        
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

//
//  MainView+TableViewExtension.swift
//  Assignment15
//
//  Created by Akaki Titberidze on 20.04.24.
//

import UIKit

extension MainView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalNews = news.count
        let totalAds = (totalNews / 3)
        return totalNews + totalAds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { fatalError("cant get NewsCell") }
        cell.selectionStyle = .none
        if indexPath.row % 4 == 3 {
            cell.configure(title: "განათავსე შენი რეკლამა აქ", time: "", image: "")
            return cell
        } else {
            let newsIndex = indexPath.row - (indexPath.row / 4)
            let item = news[newsIndex]
            cell.configure(title: item.title, time: item.time, image: item.photoUrl)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row % 4 == 3 {
            let adView = AdView()
            navigationController?.pushViewController(adView, animated: true)
        } else {
            let detailedNewsView = DetailedNewsView()
            let newsIndex = indexPath.row - (indexPath.row / 4)
            let item = news[newsIndex]
            detailedNewsView.setupInfo = item
            navigationController?.pushViewController(detailedNewsView, animated: true)
        }
    }
}

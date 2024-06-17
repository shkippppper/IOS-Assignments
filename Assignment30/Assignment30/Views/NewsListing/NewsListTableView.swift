//
//  NewsListTableView.swift
//  Assignment30
//
//  Created by Akaki Titberidze on 17.06.24.
//

import SwiftUI

struct NewsListTableView: UIViewRepresentable {
    @Binding var newsList: [SingleNews]
    @ObservedObject var viewModel: NewsViewModel
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 10
        tableView.alwaysBounceVertical = false
        tableView.isScrollEnabled = true
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(NewsCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        DispatchQueue.main.async {
            uiView.reloadData()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(newsList: $newsList, viewModel: viewModel)
    }
    
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {
        @Binding var newsList: [SingleNews]
        let viewModel: NewsViewModel
        
        init(newsList: Binding<[SingleNews]>, viewModel: NewsViewModel) {
            _newsList = newsList
            self.viewModel = viewModel
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return newsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
            let newsItem = newsList[indexPath.row]
            cell.configure(
                imageUrl: newsItem.urlToImage ?? "",
                fact: newsItem.title ?? "",
                date: viewModel.convertDateToLongString(dateString: newsItem.publishedAt ?? "") ?? ""
            )
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let newsItem = newsList[indexPath.row]
            let detailVC = NewsDetailedView(
                newsTitle: newsItem.title ?? "",
                imageUrl: newsItem.urlToImage ?? "",
                newsDate: viewModel.convertDateToLongString(dateString: newsItem.publishedAt ?? "") ?? "",
                newsDescription: newsItem.description ?? "",
                newsAuthor: newsItem.author ?? ""
            )
            tableView.window?.rootViewController?.present(detailVC, animated: true, completion: nil)
        }
    }
}

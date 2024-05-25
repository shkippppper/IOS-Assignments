//
//  CatFactsListingVC+TableViewExtension.swift
//  Assignment19
//
//  Created by Akaki Titberidze on 03.05.24.
//

import UIKit

extension CatFactsListingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.factCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatFactCell", for: indexPath) as? CatFactCell else { fatalError("cant get CatFactCell") }
        cell.selectionStyle = .none
        let fact = viewModel.factData()?[indexPath.row]
        cell.configure(fact: fact?.fact ?? "", index: "\(indexPath.row + 1).")
        // ^^^ es vxvdebi ro arasworad aris da savaraudod viewmodelshi sheidzleba amis gaketeba, tu sheidzleba feedbackze momwerot rogor...madloba
        
        viewModel.updateCellData(row: indexPath.row)
        // ^^^ ideashi es funkcionalic albat
        return cell
    }
}

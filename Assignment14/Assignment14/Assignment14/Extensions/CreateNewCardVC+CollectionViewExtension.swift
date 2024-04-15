//
//  CreateNewCardVC+CollectionViewExtension.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

extension CreateNewCardVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        statuses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomStatusCell", for: indexPath) as! CustomStatusCell
        cell.configure(status: statuses[indexPath.row])
        if selectedIndex == indexPath.row {
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 5
        } else {
            cell.layer.borderColor = UIColor.clear.cgColor
            cell.layer.borderWidth = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 110, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row

        for cell in collectionView.visibleCells {
            guard let indexPathForVisibleCell = collectionView.indexPath(for: cell) else {
                continue
            }
            if indexPathForVisibleCell.row == selectedIndex {
                cell.layer.borderColor = UIColor.white.cgColor
                cell.layer.borderWidth = 2
                cell.layer.cornerRadius = 5
            } else {
                cell.layer.borderColor = UIColor.clear.cgColor
                cell.layer.borderWidth = 0
            }
        }
    }


}

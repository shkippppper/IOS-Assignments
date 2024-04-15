//
//  MainPageVC+CollectionViewExtension.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

extension MainPageVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        wuwunis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomWuwuniCell", for: indexPath) as! CustomWuwuniCell
        cell.configure(image: wuwunis[indexPath.row].image, primary: wuwunis[indexPath.row].primaryText, description: wuwunis[indexPath.row].descriptionText, status: wuwunis[indexPath.row].status)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 2 - 32, height: 192)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            wuwunis.remove(at: indexPath.row)
            collectionView.deleteItems(at: [indexPath])
    }

}

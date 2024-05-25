//
//  GalleryVC+CollectionViewExtension.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 09.05.24.
//

import UIKit

extension GalleryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailedViewModel = DetailedViewModel()
        //es aq ar unda moxdes
        detailedViewModel.imageData = viewModel.getImageData()
        detailedViewModel.imageIndex = indexPath.row
        let detailViewController = DetailedVC(viewModel: detailedViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

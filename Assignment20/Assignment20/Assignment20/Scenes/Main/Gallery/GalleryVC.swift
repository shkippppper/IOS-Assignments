//
//  GalleryVC.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 08.05.24.
//

import UIKit

class GalleryVC: UIViewController {
    
    // MARK: - Variables
    
    enum Section {
        case main
    }
    
    var viewModel: GalleryViewModel
    var dataSource: UICollectionViewDiffableDataSource<Section, UnsplashImageModel>!
    
    // MARK: - UI Components
    
    lazy var mockNavigationTitle: UILabel = {
        let label = UILabel()
        label.text = "გალერეა"
        label.textColor = .systemBlue
        label.font = label.font.withSize(32)
        label.textAlignment = .center
        return label
    }()
    
    lazy var galleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3-2, height:  UIScreen.main.bounds.width/3-2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.identifier)
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    // MARK: - Lifecycle

    init(viewModel: GalleryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        setupLayout()
        setupData()
        configureCollectionView()
    }
    
    // MARK: - UI Setup
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(mockNavigationTitle)
        view.addSubview(galleryCollectionView)
        
        mockNavigationTitle.translatesAutoresizingMaskIntoConstraints = false
        galleryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mockNavigationTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            mockNavigationTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mockNavigationTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            galleryCollectionView.topAnchor.constraint(equalTo: mockNavigationTitle.bottomAnchor, constant: 20),
            galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupData() {
        viewModel.reloadData = { [weak self] in
            self?.applyInitialSnapshot()
        }
        galleryCollectionView.delegate = self
    }
    
    // MARK: - Helper Functions
    
    private func configureCollectionView() {
        galleryCollectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.identifier)
        dataSource = UICollectionViewDiffableDataSource<Section, UnsplashImageModel>(collectionView: galleryCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, imageData: UnsplashImageModel) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as? GalleryCell
            cell?.configure(imageUrl: imageData.urls.regular)
            return cell
        }
    }
    
    func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UnsplashImageModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.getImageData(), toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    
}

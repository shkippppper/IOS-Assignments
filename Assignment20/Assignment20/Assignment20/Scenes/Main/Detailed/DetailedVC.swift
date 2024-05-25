//
//  DetailedVC.swift
//  Assignment20
//
//  Created by Akaki Titberidze on 09.05.24.
//

import UIKit

class DetailedVC: UIViewController {
    
    private enum Section {
        case main
    }
    
    // MARK: - Variables
    var viewModel: DetailedViewModel
    private var dataSource: UICollectionViewDiffableDataSource<Section, UnsplashImageModel>!
    
    // MARK: - UI Components
    
    lazy var detailedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailedCell.self, forCellWithReuseIdentifier: DetailedCell.identifier)
        collectionView.alwaysBounceHorizontal = true
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: DetailedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configureCollectionView()
        applyInitialSnapshot()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - UI Setup

    func setupLayout() {
        view.addSubview(detailedCollectionView)
        detailedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailedCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            detailedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, UnsplashImageModel>(collectionView: detailedCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, imageData: UnsplashImageModel) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailedCell.identifier, for: indexPath) as? DetailedCell
            cell?.configure(imageUrl: imageData.urls.regular)
            
            return cell
        }
    }
    
    func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UnsplashImageModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.getImageData(), toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
        scrollToItem(at: viewModel.getImageIndex())
    }
    
    // MARK: - Helper Functions
    
    private func scrollToItem(at index: Int) {
        detailedCollectionView.layoutIfNeeded()
        let indexPath = IndexPath(item: index, section: 0)
        if detailedCollectionView.numberOfItems(inSection: 0) > index {
            detailedCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

import UIKit

class : UIViewController {
    
    var viewModel: DetailedViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    init(viewModel: DetailedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func setupData() {
        
    }
}

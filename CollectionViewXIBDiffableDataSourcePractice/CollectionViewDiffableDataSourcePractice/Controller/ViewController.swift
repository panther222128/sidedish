//
//  ViewController.swift
//  CollectionViewDiffableDataSourcePractice
//
//  Created by Jun Ho JANG on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Model>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Model>()
    private var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configureDataSource()
        createSnapshot()
        
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: "CollectionViewCell", bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: "CustomCellReuseIdentifier")
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<CollectionViewCell, Model> { (cell, indexPath, model) in
            cell.image.image = self.viewModel.member[indexPath.row].image
            cell.name.text = self.viewModel.member[indexPath.row].name
            cell.role.text = self.viewModel.member[indexPath.row].role
            cell.nickname.text = self.viewModel.member[indexPath.row].nickName
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Model>(collectionView: customCollectionView) {
            (collectionView, indexPath, model) -> CollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: model)
        }
    }
    
    private func createSnapshot() {
        snapshot.appendSections([Section.main])
        snapshot.appendItems(viewModel.member, toSection: Section.main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

extension ViewController {
    
    enum Section {
        case main
    }
    
}

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
        let nibName = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: "CustomCellReuseIdentifier")
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<CustomCollectionViewCell, Model> { (cell, indexPath, model) in
            cell.memberImage.image = self.viewModel.returnMember[indexPath.row].image
            cell.memberName.text = self.viewModel.returnMember[indexPath.row].name
            cell.memberRole.text = self.viewModel.returnMember[indexPath.row].role
            cell.memberNickname.text = self.viewModel.returnMember[indexPath.row].nickName
        }
        dataSource = UICollectionViewDiffableDataSource<Section, Model>(collectionView: customCollectionView) {
            (collectionView, indexPath, model) -> CustomCollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: model)
        }
    }
    
    private func createSnapshot() {
        snapshot.appendSections([Section.main])
        snapshot.appendItems(viewModel.returnMember, toSection: Section.main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

extension ViewController {
    
    enum Section {
        case main
    }
    
}

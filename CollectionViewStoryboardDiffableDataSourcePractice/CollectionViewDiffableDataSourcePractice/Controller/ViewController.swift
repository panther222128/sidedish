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
        print(customCollectionView.visibleCells)
    }
    
    private func registerNib() {
        let nibName = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        customCollectionView.register(nibName, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Model>(collectionView: customCollectionView) {
            (collectionView, indexPath, model) -> CustomCollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as? CustomCollectionViewCell else { return CustomCollectionViewCell() }
            
            cell.memberImage.image = model.image
            cell.memberName.text = "\(model.name)"
            cell.memberRole.text = model.role
            cell.memberNickname.text = model.nickName
            
            return cell
        }
    }
    
    private func createSnapshot() {
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.returnMember)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

extension ViewController {
    
    enum Section {
        case main
    }
    
}

//
//  MainDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit

class MainDishViewController: UIViewController {
    
    private var viewModel = MainViewModel()
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    
    private var dishDataSource: UICollectionViewDiffableDataSource<Section, Dish>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        configureDataSource()
        createSnapshot()
    }
      
}

extension MainDishViewController {
    
    private func registerNib() {
        let nibName = UINib(nibName: DishCell.reuseIdentifier, bundle: nil)
        self.dishCollectionView.register(nibName, forCellWithReuseIdentifier: DishCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        
        self.dishDataSource = UICollectionViewDiffableDataSource<Section, Dish>(collectionView: dishCollectionView) { (collectionView, indexPath, dish) -> DishCell? in
            
            let cell = self.dishCollectionView.dequeueReusableCell(withReuseIdentifier: DishCell.reuseIdentifier, for: indexPath) as! DishCell
            
            cell.fill(with: dish)
            return cell
        }
    }
    
    private func createSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Dish>()
        
        self.viewModel.update{ (section, items) in
            snapshot.appendSections([section])
            snapshot.appendItems(items)
            self.dishDataSource.apply(snapshot)
        }
    }
}

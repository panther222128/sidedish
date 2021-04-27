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
        dishCollectionView.delegate = self
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
        
        let headerRegisteration = UICollectionView.SupplementaryRegistration<DishSupplementaryView>.init(supplementaryNib: DishSupplementaryView.nib, elementKind: UICollectionView.elementKindSectionHeader) { (supplymentaryView, string, indexPath) in
            print(indexPath)
            supplymentaryView.sectionTitleLabel.text = Section.allCases[indexPath.section].rawValue
        }
        print()
        
        self.dishDataSource = UICollectionViewDiffableDataSource<Section, Dish>(collectionView: dishCollectionView) { (collectionView, indexPath, dish) -> DishCell? in
            
            let cell = self.dishCollectionView.dequeueReusableCell(withReuseIdentifier: DishCell.reuseIdentifier, for: indexPath) as! DishCell
            
            cell.fill(with: dish)
            return cell
        }
        
        self.dishDataSource.supplementaryViewProvider = { (collectionView, elementkind, indexPath) -> UICollectionReusableView? in
            return     self.dishCollectionView.dequeueConfiguredReusableSupplementary(using: headerRegisteration, for: indexPath)
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

extension MainDishViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: CGFloat(130))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            backgroundColorForSectionAt section: Int) -> UIColor{
        .darkGray
    }
    
}

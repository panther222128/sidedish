//
//  MainDishViewController.swift
//  SidedishApp
//
//  Created by Lia on 2021/04/20.
//

import UIKit


protocol SendInfoDelegate {
    func send(section: Section, detail: Dish?)
}

class MainDishViewController: UIViewController {
    
    private var viewModel: MainViewModel!
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    var delegate: SendInfoDelegate?
    
    private var dishDataSource: UICollectionViewDiffableDataSource<Section, Dish>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DefaultMainViewModel()
        viewModel.requestAll()
        
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
            
            supplymentaryView.sectionTitleLabel.text = Section.allCases[indexPath.section].rawValue
        }
        
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
        if section % 2 == 0 { return .darkGray }
        return .systemBackground
    }
    
}

extension MainDishViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dish = self.dishDataSource.itemIdentifier(for: indexPath)!
        let section = Section.allCases[indexPath.section]
        delegate?.send(section: section, detail: dish)
        
        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailDishViewController") as DetailDishViewController
        
        detailViewController.dish = dish
        detailViewController.section = section
        
        self.navigationController?.pushViewController(detailViewController, animated: false)

    }
}

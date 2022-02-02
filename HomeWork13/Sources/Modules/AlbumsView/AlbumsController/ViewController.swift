//
//  ViewController.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 30.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [SettingsSection]()
    
    // MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        collectionView.register(CellsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellsHeader.identifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBur()
        setupHierarchy()
        setupLayout()
        updateData(addTo: FirstSection.addFirstSection())
        updateData(addTo: SecondSection.addSecondSection())
        updateData(addTo: ThirdSection.addThirdSection())
        updateData(addTo: FourthSection.addfourthSection())
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setupNavigationBur() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    private func setupCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            switch self.data[sectionIndex].typeCell {
            case .twoRowCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
                
                let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
                topItem.contentInsets = contentInset
                
                let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bottomItem.contentInsets = contentInset
                
                let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(500)), subitems: [topItem, bottomItem])
                
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                        heightDimension: .estimated(50)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                
                let sectionOne = NSCollectionLayoutSection(group: nestedGroup)
                sectionOne.boundarySupplementaryItems = [header]
                sectionOne.orthogonalScrollingBehavior = .groupPaging
                sectionOne.contentInsets = .init(top: 0,
                                                 leading: 15,
                                                 bottom: 20,
                                                 trailing: 0
                )
                return sectionOne
            case .oneRowCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 50, trailing: 5)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(190), heightDimension: .absolute(500 / 2)), subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                        heightDimension: .estimated(50)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.orthogonalScrollingBehavior = .groupPaging
                section.boundarySupplementaryItems = [header]
                return section
                
            case .listCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                        heightDimension: .estimated(50)
                )
                
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 0, leading: 15, bottom: 20, trailing: 0)
                section.boundarySupplementaryItems = [header]
                
                return section
                
            }
        }
    }
    
    private func updateData(addTo: [SettingsSection]) -> [SettingsSection] {
        data.append(contentsOf: addTo)
        return data
    }
}








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
        updateData(addTo: SettingsSection.addFirstSection())
        updateData(addTo: SettingsSection.addSecondSection())
        updateData(addTo: SettingsSection.addThirdSection())
        updateData(addTo: SettingsSection.addfourthSection())
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Metric.collectionViewTopAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metric.collectionViewLeadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Metric.collectionViewTrailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func setupNavigationBur() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
    private func setupCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            switch self.data[sectionIndex].typeCell {
            case .twoRowCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.twoRowItemSizeWidth), heightDimension: .fractionalHeight(Metric.twoRowItemSizeHeight))
                let contentInset = NSDirectionalEdgeInsets(top: Metric.twoRowTopItemContentInsetTop, leading: Metric.twoRowTopItemContentInsetLeading, bottom: Metric.twoRowTopItemContentInsetBottom, trailing: Metric.twoRowTopItemContentInsetTraeling)
                let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
                topItem.contentInsets = contentInset
                let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bottomItem.contentInsets = NSDirectionalEdgeInsets(top: Metric.twoRowBottomItemContentInsetTop, leading: Metric.twoRowBottomItemContentInsetLeading, bottom: Metric.twoRowBottomItemContentInsetBottom, trailing: Metric.twoRowBottomItemContentInsetTraeling)
                let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Metric.twoRowNestedGroupWidth), heightDimension: .absolute(Metric.twoRowNestedGroupHeight)), subitems: [topItem, bottomItem])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.twoRowHeaderSizeWidth),
                                                        heightDimension: .estimated(Metric.twoRowHeaderSizeHeight)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                let sectionOne = NSCollectionLayoutSection(group: nestedGroup)
                sectionOne.boundarySupplementaryItems = [header]
                sectionOne.orthogonalScrollingBehavior = .groupPaging
                sectionOne.contentInsets = .init(top: Metric.twoRowSectionContentInsetsTop,
                                                 leading: Metric.twoRowSectionContentInsetsLeading,
                                                 bottom: Metric.twoRowSectionContentInsetsBottom,
                                                 trailing: Metric.twoRowSectionContentInsetsTrailing
                )
                return sectionOne
            case .oneRowCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.oneRowItemSizeWidth), heightDimension: .fractionalHeight(Metric.oneRowItemSizeHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: Metric.oneRowItemContentInsetTop, leading: Metric.oneRowItemContentInsetLeading, bottom: Metric.oneRowItemContentInsetBottom, trailing: Metric.oneRowItemContentInsetTraeling)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(Metric.oneRowGroupWidth), heightDimension: .absolute(Metric.oneRowGroupHeight)), subitems: [item])
                
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.oneRowHeaderSizeWidth),
                                                        heightDimension: .estimated(Metric.oneRowHeaderSizeHeight)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: Metric.oneRowSectionContentInsetsTop, leading: Metric.oneRowSectionContentInsetsLeading, bottom: Metric.oneRowSectionContentInsetsBottom, trailing: Metric.oneRowSectionContentInsetsTrailing)
                section.orthogonalScrollingBehavior = .groupPaging
                section.boundarySupplementaryItems = [header]
                return section
            case .listCells:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.listRowItemSizeWidth), heightDimension: .fractionalHeight(Metric.listRowItemSizeHeight))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: Metric.listRowItemContentInsetTop, leading: Metric.listRowItemContentInsetLeading, bottom: Metric.listRowItemContentInsetBottom, trailing: Metric.listRowItemContentInsetTraeling)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.listRowGroupWidth), heightDimension: .estimated(Metric.listRowGroupHeight)), subitems: [item])
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metric.listRowHeaderSizeWidth),
                                                        heightDimension: .estimated(Metric.listRowHeaderSizeHeight)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                         elementKind: UICollectionView.elementKindSectionHeader,
                                                                         alignment: .top
                )
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: Metric.listRowSectionContentInsetsTop, leading: Metric.listRowSectionContentInsetsLeading, bottom: Metric.listRowSectionContentInsetsBottom, trailing: Metric.listRowSectionContentInsetsTrailing)
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

// MARK: - Constants

extension ViewController {
    enum Metric {
        static let collectionViewTopAnchor: CGFloat = 5
        static let collectionViewLeadingAnchor: CGFloat = 0
        static let collectionViewTrailingAnchor: CGFloat = 0
        
        //TwoRowSection
        
        static let twoRowItemSizeWidth: CGFloat = 1
        static let twoRowItemSizeHeight: CGFloat = 0.5
        static let twoRowTopItemContentInsetTop: CGFloat = 5
        static let twoRowTopItemContentInsetLeading: CGFloat = 5
        static let twoRowTopItemContentInsetBottom: CGFloat = 50
        static let twoRowTopItemContentInsetTraeling: CGFloat = 5
        
        static let twoRowBottomItemContentInsetTop: CGFloat = -30
        static let twoRowBottomItemContentInsetLeading: CGFloat = 5
        static let twoRowBottomItemContentInsetBottom: CGFloat = 80
        static let twoRowBottomItemContentInsetTraeling: CGFloat = 5
        
        static let twoRowNestedGroupWidth: CGFloat = 190
        static let twoRowNestedGroupHeight: CGFloat = 500
        
        static let twoRowHeaderSizeWidth: CGFloat = 0.98
        static let twoRowHeaderSizeHeight: CGFloat = 50
        
        static let twoRowSectionContentInsetsTop: CGFloat = 0
        static let twoRowSectionContentInsetsLeading: CGFloat = 15
        static let twoRowSectionContentInsetsBottom: CGFloat = -70
        static let twoRowSectionContentInsetsTrailing: CGFloat = 0
        
        //OneRowSection
        
        static let oneRowItemSizeWidth: CGFloat = 1
        static let oneRowItemSizeHeight: CGFloat = 1
        static let oneRowItemContentInsetTop: CGFloat = 5
        static let oneRowItemContentInsetLeading: CGFloat = 5
        static let oneRowItemContentInsetBottom: CGFloat = 50
        static let oneRowItemContentInsetTraeling: CGFloat = 5
        
        static let oneRowGroupWidth: CGFloat = 190
        static let oneRowGroupHeight: CGFloat = 500 / 2
        
        static let oneRowHeaderSizeWidth: CGFloat = 0.98
        static let oneRowHeaderSizeHeight: CGFloat = 50
        
        static let oneRowSectionContentInsetsTop: CGFloat = 0
        static let oneRowSectionContentInsetsLeading: CGFloat = 15
        static let oneRowSectionContentInsetsBottom: CGFloat = -40
        static let oneRowSectionContentInsetsTrailing: CGFloat = 0
        
        //ListRowSection
        
        static let listRowItemSizeWidth: CGFloat = 1
        static let listRowItemSizeHeight: CGFloat = 1
        static let listRowItemContentInsetTop: CGFloat = 0
        static let listRowItemContentInsetLeading: CGFloat = 0
        static let listRowItemContentInsetBottom: CGFloat = 0
        static let listRowItemContentInsetTraeling: CGFloat = 0
        
        static let listRowGroupWidth: CGFloat = 1
        static let listRowGroupHeight: CGFloat = 50
        
        static let listRowHeaderSizeWidth: CGFloat = 0.98
        static let listRowHeaderSizeHeight: CGFloat = 50
        
        static let listRowSectionContentInsetsTop: CGFloat = 0
        static let listRowSectionContentInsetsLeading: CGFloat = 15
        static let listRowSectionContentInsetsBottom: CGFloat = 5
        static let listRowSectionContentInsetsTrailing: CGFloat = 0
        
    }
}






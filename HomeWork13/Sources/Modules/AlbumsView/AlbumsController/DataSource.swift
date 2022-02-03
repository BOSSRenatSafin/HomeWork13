//
//  DataSource.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 31.01.2022.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = data[indexPath.section].albums[indexPath.row]
        
        switch data[indexPath.section].typeCell {
            
        case .oneRowCells, .twoRowCells:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
            cell.configure(model: model)
            return cell
            
        case .listCells:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell else { return UICollectionViewCell() }
            cell.configure(model: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerOne = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellsHeader.identifier, for: indexPath) as! CellsHeader
        headerOne.label.text = data[indexPath.section].title
        headerOne.button.setTitle(data[indexPath.section].button, for: .normal)
        return headerOne
    }
}


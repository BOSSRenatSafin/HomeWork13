//
//  AlbumsViewController.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 30.01.2022.
//

import UIKit

class AlbumsViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBur()
    }
    
    // MARK: - Settings
    
    private func setupNavigationBur() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
}

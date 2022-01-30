//
//  TabBarController.swift
//  HomeWork13
//
//  Created by Ренат Сафин on 30.01.2022.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let mediaViewController = MediaViewController()
        mediaViewController.tabBarItem = UITabBarItem(title: "Медиатека",
                                                      image: UIImage(named: "1"),
                                                      tag: 0)
        let forYouViewController = ForYouViewController()
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас",
                                                       image: .init(systemName: "heart.text.square"),
                                                       tag: 1)
        let albumsNavigationViewController = UINavigationController(rootViewController: AlbumsViewController())
        albumsNavigationViewController.tabBarItem = UITabBarItem(title: "Альбом",
                                                                 image: .init(systemName: "rectangle.stack.fill"),
                                                                 tag: 2)
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск",
                                                       image: .init(systemName: "magnifyingglass"),
                                                       tag: 3)
        
        setViewControllers([mediaViewController,
                           forYouViewController,
                           albumsNavigationViewController,
                           searchViewController
                           ], animated: true)
        
        selectedIndex = 2
    }
}

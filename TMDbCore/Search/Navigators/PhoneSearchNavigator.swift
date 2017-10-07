//
//  PhoneSearchNavigator.swift
//  TMDbCore
//
//  Created by Carlos on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class PhoneSearchNavigator: SearchNavigator {
    private unowned let viewControllerProvider: SearchResultsViewControllerProvider
    private var searchController: UISearchController!
    
    init(viewControllerProvider: SearchResultsViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }
    
    func installSearch(viewController: UIViewController) {
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        
        // Configuración del searchController
        searchController.searchResultsUpdater = resultsViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true // La info se presenta en este recuadro y no en la interfaz entera
    }
}

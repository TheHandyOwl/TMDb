//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by Carlos on 7/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator: DetailNavigator {
    private let navigationController: UINavigationController
    private unowned var viewControllerProvider: DetailViewControllerProvider
    
    init(navigationController: UINavigationController,
         viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navigationController
        self.viewControllerProvider = viewControllerProvider
    }
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
        let viewController = viewControllerProvider.detailViewController(identifier: identifier, mediaType: mediaType)
        navigationController.pushViewController(viewController, animated: true)
    }
}

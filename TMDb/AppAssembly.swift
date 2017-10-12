//
//  AppAssembly.swift
//  TMDb
//
//  Created by Carlos on 6/10/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
    private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)

    // Tenemos que meter el rootVC en el AppDelegate para evitar referencias cíclicas.
    private(set) lazy var navigationController = UINavigationController()
    private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}

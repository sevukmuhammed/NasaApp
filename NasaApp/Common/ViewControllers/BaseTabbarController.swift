//
//  BaseTabbarController.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit
import Swinject

final class BaseTabbarController: UITabBarController, UITabBarControllerDelegate {
    var container: Container!
    var disposeBag: DisposeBag!
    var selectIndex: Int!
    
    convenience init(container: Container, disposeBag: DisposeBag) {
        self.init()
        self.container = container
        self.disposeBag = disposeBag
        setupViewControllers()
        setTabBarColor()
        self.delegate = self
    }
    
    func setTabBarColor() {
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = UIColor(red: 41/255, green: 51/255, blue: 144/255, alpha: 1)
    }
    
    func setupViewControllers() {
        self.getNavigationList(components: ["CuriosityPage", "OpportunityPage", "SpiritPage"])
    }
    
    func initializeNavigationService(coord: BaseCoordinator, viewController: BaseViewController, navController: BaseNavigationController, navigation: Navigation<Any>) {
        try! NavigationService.requestNavigationObject().start(fromViewController: viewController, navigationController: navController, prevCoordinator: coord, nextScene: navigation.scene, data: navigation.data, animation: navigation.animation)
    }
}


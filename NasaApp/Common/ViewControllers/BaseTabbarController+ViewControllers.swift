//
//  BaseTabbarController+ViewControllers.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import UIKit
import RxSwift
import Swinject

extension BaseTabbarController {
    func curiosityNavigation() -> UINavigationController {
        let curiosityViewController = container.resolveViewController(MainPageViewController.self)
        curiosityViewController.tabBarItem = UITabBarItem(title: "Curiosity", image: UIImage(systemName: "c.circle"), tag: 0)
        curiosityViewController.type = "curiosity"
        curiosityViewController.tabBarItem.selectedImage = UIImage(systemName: "c.circle.fill")
        let curiosityNavigation = BaseNavigationController(rootViewController: curiosityViewController)
        curiosityViewController.navigationSubject.subscribe(onNext: { navigation in
            let curiosityCoordinator = MainPageCoordinator(container: self.container,
                                                                       navigationController: curiosityNavigation,
                                                                       disposeBag: self.disposeBag,
                                                                       fromViewController: nil)
                         self.initializeNavigationService(coord: curiosityCoordinator,
                                                          viewController: curiosityViewController,
                                                          navController: curiosityNavigation,
                                                          navigation: navigation)
        }).disposed(by: disposeBag)
        return curiosityNavigation
    }
    
    func opportunityNavigation() -> UINavigationController {
        let opportunityViewController = container.resolveViewController(MainPageViewController.self)
        opportunityViewController.tabBarItem = UITabBarItem(title: "Opportunity", image: UIImage(systemName: "o.circle"), tag: 1)
        opportunityViewController.type = "opportunity"
        opportunityViewController.tabBarItem.selectedImage = UIImage(systemName: "o.circle.fill")
        let opportunityNavigation = BaseNavigationController(rootViewController: opportunityViewController)
        opportunityViewController.navigationSubject.subscribe(onNext: { navigation in
            let opportunityCoordinator = MainPageCoordinator(container: self.container,
                                                                       navigationController: opportunityNavigation,
                                                                       disposeBag: self.disposeBag,
                                                                       fromViewController: nil)
                         self.initializeNavigationService(coord: opportunityCoordinator,
                                                          viewController: opportunityViewController,
                                                          navController: opportunityNavigation,
                                                          navigation: navigation)
        }).disposed(by: disposeBag)
        return opportunityNavigation
    }
    
    func spiritNavigation() -> UINavigationController {
        let spiritViewController = container.resolveViewController(MainPageViewController.self)
        spiritViewController.tabBarItem = UITabBarItem(title: "Spirit", image: UIImage(systemName: "s.circle"), tag: 2)
        spiritViewController.type = "spirit"
        spiritViewController.tabBarItem.selectedImage = UIImage(systemName: "s.circle.fill")
        let spiritNavigation = BaseNavigationController(rootViewController: spiritViewController)
        spiritViewController.navigationSubject.subscribe(onNext: { navigation in
            let spiritCoordinator = MainPageCoordinator(container: self.container,
                                                                       navigationController: spiritNavigation,
                                                                       disposeBag: self.disposeBag,
                                                                       fromViewController: nil)
                         self.initializeNavigationService(coord: spiritCoordinator,
                                                          viewController: spiritViewController,
                                                          navController: spiritNavigation,
                                                          navigation: navigation)
        }).disposed(by: disposeBag)
        return spiritNavigation
    }
    
    func getNavigation(title: String) -> UINavigationController {
        switch title {
        case "CuriosityPage":
            return curiosityNavigation()
        case "OpportunityPage":
            return opportunityNavigation()
        case "SpiritPage":
            return spiritNavigation()
        default:
            return curiosityNavigation()
        }
    }
    
    func getNavigationList(components: [String]) {
        var navi = [UINavigationController]()
        
        components.forEach { (component) in
            
            navi.append(getNavigation(title: component))
        }
        
        self.viewControllers = navi
    }
}

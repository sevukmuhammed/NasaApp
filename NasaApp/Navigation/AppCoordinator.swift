//
//  AppCoordinator.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import UIKit
import os.log
import Swinject
import RxSwift

enum AppMainScene: String, AppScene {
    case app = "app"
    case homePage = "homepage"
    case detailPage = "detailpage"
    case back = "back"
    
    var identifier: String {
        return "AppMain"
    }
    
    var name: String {
        return self.rawValue
    }
    
    var coordinator: BaseCoordinator.Type {
        return BaseCoordinator.self
    }
}

final class AppCoordinator: CoordinatorProtocol {
    
    private let window: UIWindow
    let container: Container
    private let disposeBag: DisposeBag = DisposeBag()
    private let tabbarController: BaseTabbarController
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
        
        tabbarController = BaseTabbarController(container: container, disposeBag: self.disposeBag)
        self.window.rootViewController = tabbarController
        NavigationService.initializeNavigationService(container,disposeBag: disposeBag,fromViewController: nil)
        
    }
    
    func navigate(scene: AppScene, data: Any) {
        let _scene = scene as! AppMainScene
        switch _scene {
        case .homePage:
            self.tabbarController.selectIndex = 0
            break
        case .app:
            break
        case .back:
            break
        case .detailPage:
            break
        }
    }
    
    func back(_ viewController: UIViewController) {
        
    }
    
    func start(_ scene: AppScene, data: Any) {
    }
}


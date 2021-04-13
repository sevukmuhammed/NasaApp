//
//  MainPageCoordinator.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import UIKit
import Swinject
import RxSwift

public enum MainPageScene: String, AppScene {
    case back = "back"
    case homepage = "homepage"
    
    public var identifier: String {
        return "HomePage"
    }
    
    public var coordinator: BaseCoordinator.Type {
        return MainPageCoordinator.self
    }
    
    public var name: String {
        return self.rawValue
    }
}

final class MainPageCoordinator: BaseCoordinator {
    override func start(_ scene: AppScene, data: Any) {
        viewController = container.resolveViewController(MainPageViewController.self)
        navigationController.pushViewController(viewController, animated: true)
    }
}


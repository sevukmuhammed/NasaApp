//
//  AppDelegate+Ioc.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import os.log
import SwinjectAutoregistration
import Swinject
import RxSwift

extension AppDelegate {
    internal func initDependencyGraph() {
        self.registerGlobalDependencies(container)
        MainPageComponent.register(container)
    }
    
    private func registerGlobalDependencies(_ container: Container) {
        container.autoregister(DisposeBag.self, initializer: DisposeBag.init  as ()-> DisposeBag).inObjectScope(.container)
    }
}


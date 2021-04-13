//
//  MainPageViewController+Subscribe.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftMessages

extension MainPageViewController {
    func subscribeAll() {
        subscribeViewModel()
        subscribeNavigationFilterButton()
        subscribeFilterData()
    }
    
    func subscribeViewModel() {
        self.viewModel
            .behaviorRelay
            .subscribe(onNext: { value in
                    self.collectionView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func subscribeNavigationFilterButton() {
        self.viewModel.filterClickSubject
            .subscribe(onNext: { value in
                if value {
                    let popup = try! SwiftMessages.viewFromNib(named: "FilterView") as! FilterView
                    popup.filterDataSubject = self.viewModel.filterDataSubject
                    popup.ignoreFilterData = self.viewModel.ignoreFilterData
                    popup.disposeBag = self.disposeBag
                    var config = SwiftMessages.Config()
                    config.presentationStyle = .center
                    config.duration = .forever
                    config.keyboardTrackingView = KeyboardTrackingView()
                    config.dimMode = .blur(style: .dark, alpha: 1.0, interactive: true)
                    config.interactiveHide = true
                    SwiftMessages.show(config: config, view: popup)
                }
        }).disposed(by: disposeBag)
    }
    
    func subscribeFilterData() {
        self.viewModel.filterDataSubject
            .subscribe(onNext: { value in
                if !self.viewModel.ignoreFilterData.value && value != "" {
                    self.viewModel.pageRelay.accept(1)
                    self.viewModel.array.removeAll()
                    self.viewModel.isFilteredData.accept(true)
                    self.viewModel.getFilteredData(page: self.viewModel.pageRelay.value, camera: value, type: self.type ?? "")
                }
                else if self.viewModel.ignoreFilterData.value {
                    self.viewModel.pageRelay.accept(1)
                    self.viewModel.array.removeAll()
                    self.viewModel.isFilteredData.accept(false)
                    self.collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
                    self.viewModel.getData(page: self.viewModel.pageRelay.value, type: self.type ?? "")
                }
        }).disposed(by: disposeBag)
    }
        
}



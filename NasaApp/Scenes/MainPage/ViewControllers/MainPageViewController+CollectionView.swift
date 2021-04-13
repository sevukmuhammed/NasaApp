//
//  MainPageViewController+CollectionView.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import RxCocoa
import RxSwift
import SwiftMessages

extension MainPageViewController: UICollectionViewDataSource {
    
    internal func bindCollectionView() {
        registerCollectionViewCells()
    }
    
    private func registerCollectionViewCells() {
        collectionView.register(cellType: ItemCell.self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.behaviorRelay.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.cellData = viewModel.behaviorRelay.value[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.behaviorRelay.value.count) - 1 && !viewModel.isFilteredData.value {
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (timer:Timer) in
                    self.viewModel.pageRelay.accept(self.viewModel.pageRelay.value + 1)
                self.viewModel.getData(page: self.viewModel.pageRelay.value, type: self.type ?? "")
            })
            
        } else if indexPath.row == (viewModel.behaviorRelay.value.count) - 1 && viewModel.isFilteredData.value {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { [self] (timer:Timer) in
                    self.viewModel.pageRelay.accept(self.viewModel.pageRelay.value + 1)
                self.viewModel.getFilteredData(page: self.viewModel.pageRelay.value, camera: self.viewModel.filterDataSubject.value, type: self.type ?? "")
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showPopup(indexPath: indexPath)
    }
    
    func showPopup(indexPath: IndexPath) {
        let popup = try! SwiftMessages.viewFromNib(named: "DetailView") as! DetailView
        popup.detailData = self.viewModel.behaviorRelay.value[indexPath.row]
        popup.disposeBag = self.disposeBag
        var config = SwiftMessages.Config()
        config.presentationStyle = .center
        config.duration = .forever
        config.keyboardTrackingView = KeyboardTrackingView()
        config.dimMode = .blur(style: .dark, alpha: 1.0, interactive: true)
        config.interactiveHide = true
        SwiftMessages.show(config: config, view: popup)
    }
}

extension MainPageViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 20) / 2, height: ((collectionView.frame.width - 10) / 2) * 16 / 9)
        
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 5
    }

}



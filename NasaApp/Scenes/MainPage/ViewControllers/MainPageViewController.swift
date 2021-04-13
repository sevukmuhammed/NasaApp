//
//  MainPageViewController.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import Swinject

final class MainPageViewController: BaseViewController, MainPageStoryboardLoadable {
    
    var container: Container!
    var disposeBag: DisposeBag!
    var viewModel: MainPageViewModel!
    var type: String?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()
        subscribeAll()
        bindCollectionView()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.viewModel.getData(page: self.viewModel.pageRelay.value, type: self.type ?? "")
    }
    
    func setupNavigationBarButtons() {
        let navigationView = NavigationView.loadFromNib()
        navigationView.filterSubject = self.viewModel.filterClickSubject
        self.navigationItem.titleView = navigationView
    }

}

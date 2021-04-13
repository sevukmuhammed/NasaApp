//
//  MainPageViewModel.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 12.04.2021.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

final class MainPageViewModel: BaseViewModel {
    
    private var repository: Repository!
    var behaviorRelay = BehaviorRelay<[PhotoModel]>(value: [PhotoModel]())
    var pageRelay = BehaviorRelay<Int>(value: 1)
    var array = [PhotoModel]()
    var filterClickSubject = BehaviorRelay<Bool>(value: false)
    var filterDataSubject = BehaviorRelay<String>(value: "")
    var ignoreFilterData = BehaviorRelay<Bool>(value: false)
    var isFilteredData = BehaviorRelay<Bool>(value: false)
    
    init(disposeBag: DisposeBag, Repository: Repository) {
        super.init()
        self.disposeBag = disposeBag
        self.repository = Repository
    }
    
    func getData(page: Int, type: String) {
        self.repository.getData(APIResponse.self, type: type, page: self.pageRelay.value).subscribe(onNext: { data in
            self.behaviorRelay.accept(self.addData(data: data))
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func getFilteredData(page: Int, camera: String, type: String) {
        self.repository.getFilterData(APIResponse.self, type: type, camera: camera, page: page).subscribe(onNext: { data in
            self.behaviorRelay.accept(self.addData(data: data))
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
    
    func addData(data: APIResponse?) -> [PhotoModel] {
        data?.photos.forEach({ photo in
            array.append(photo)
        })
        return array
    }
}


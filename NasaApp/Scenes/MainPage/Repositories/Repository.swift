//
//  Repository.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import RxSwift

final class Repository {
    
    func getData<T>(_ dump: T.Type, type: String, page: Int) -> Observable<T> where T : Decodable, T : Encodable {
        return provider.rx
            .request(.getData(type, page))
            .observeOn(MainScheduler.instance)
            .map(T.self)
            .asObservable()
    }
    
    func getFilterData<T>(_ dump: T.Type, type: String, camera: String, page: Int) -> Observable<T> where T : Decodable, T: Encodable {
        return provider.rx
            .request(.getFilter(type, camera, page))
            .observeOn(MainScheduler.instance)
            .map(T.self)
            .asObservable()
    }
}



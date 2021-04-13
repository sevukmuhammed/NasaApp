//
//  MoyaProvider.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import Moya

private let apiKey = "ISGIapQG8AuTYm1r1cDmCJmQwkgaPUnbengNKkbZ"

let provider: MoyaProvider<API> = {
    return MoyaProvider<API>.init(plugins: [NetworkLoggerPlugin()])
}()


enum API {
    case getData(_ type: String, _ page: Int)
    case getFilter(_ type: String, _ camera: String, _ page: Int)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.nasa.gov/")!
    }
    
    var path: String {
        switch self {
        case .getData(let type, _), .getFilter(let type, _ ,  _):
            return "mars-photos/api/v1/rovers/\(type)/photos"
       
        default:
            return "mars-photos/api/v1/rovers/curiosity/photos"
        }
        
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "sample".data(using: .utf8) ?? Data()
    }
    
    var task: Task {
        switch self {
        case .getData(_ , let page):
            return .requestParameters(parameters: [
                                        "sol": 1000,
                                        "api_key": apiKey,
                                        "page": page
                                        ], encoding: URLEncoding.queryString)
        case .getFilter(_ , let camera , let page):
            return .requestParameters(parameters: [
                                        "sol": 1000,
                                        "api_key": apiKey,
                                        "camera": camera,
                                        "page": page
                ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "*/*"]
    }
    
    
}



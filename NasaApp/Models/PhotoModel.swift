//
//  PhotoModel.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation

struct APIResponse: Codable {
    var photos: [PhotoModel]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }
}

struct PhotoModel: Codable {
    var id: Int?
    var sol: Int?
    var camera: Camera?
    var imgSrc: String?
    var earthDate: String?
    var rover: Rover?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case sol = "sol"
        case camera = "camera"
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover = "rover"
    }
}

struct Camera: Codable {
    var id: Int?
    var name: String?
    var roverId: Int?
    var fullName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case roverId = "rover_id"
        case fullName = "full_name"
    }
}

struct Rover: Codable {
    var id: Int?
    var name: String?
    var landingDate: String?
    var launchDate: String?
    var status: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
    }
}

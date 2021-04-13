//
//  Navigation.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation

public struct Navigation<T> {
    public let scene: AppScene
    public let data: Any
    public let name: String?
    public let animation: Bool?
    
    public init(_ scene:AppScene, data:Any, name: String? = nil, animation: Bool? = nil) {
        self.scene = scene
        self.data = data
        self.name = name
        self.animation = animation
    }
}


//
//  StoryboardLoadable.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import UIKit

public protocol StoryboardLoadable: AnyObject {
    @nonobjc static var storyboardName: String { get }
}


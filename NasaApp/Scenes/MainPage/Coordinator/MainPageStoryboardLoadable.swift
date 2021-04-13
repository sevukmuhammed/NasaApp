//
//  MainPageStoryboardLoadable.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import UIKit
import Foundation

public protocol MainPageStoryboardLoadable: StoryboardLoadable {}

extension MainPageStoryboardLoadable where Self: UIViewController {
  @nonobjc static var storyboardName: String {
        return "MainPage"
    }
}


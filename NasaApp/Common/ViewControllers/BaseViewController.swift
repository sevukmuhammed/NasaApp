//
//  BaseViewController.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import Foundation
import RxSwift
public class BaseViewController : UIViewController  {
    
    public let navigationSubject = PublishSubject<Navigation<Any>>()
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 41/255, green: 51/255, blue: 144/255, alpha: 1)
    }
}


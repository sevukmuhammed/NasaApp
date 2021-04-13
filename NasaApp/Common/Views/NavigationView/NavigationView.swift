//
//  NavigationView.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 10.04.2021.
//

import Foundation
import UIKit
import Reusable
import RxSwift
import RxCocoa

class NavigationView: UIView, NibLoadable {
    
    var filterSubject = BehaviorRelay<Bool>(value: false)
    let disposeBag = DisposeBag()
    
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        self.filterSubject.accept(true)
    }
}

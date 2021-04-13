//
//  FilterView.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 10.04.2021.
//

import Foundation
import Reusable
import SwiftMessages
import RxSwift
import RxCocoa

final class FilterView: MessageView, NibLoadable {
    
    @IBOutlet weak var fhazCheckbox: UIButton!
    @IBOutlet weak var rhazCheckbox: UIButton!
    @IBOutlet weak var mastCheckbox: UIButton!
    @IBOutlet weak var chemcamCheckbox: UIButton!
    @IBOutlet weak var mahliCheckbox: UIButton!
    @IBOutlet weak var mardiCheckbox: UIButton!
    @IBOutlet weak var navcamCheckbox: UIButton!
    @IBOutlet weak var pancamCheckbox: UIButton!
    @IBOutlet weak var minitesCheckbox: UIButton!
    @IBOutlet weak var ignoreButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    var filterDataSubject = BehaviorRelay<String>(value: "")
    var ignoreFilterData = BehaviorRelay<Bool>(value: false)
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches,
                           with: event)
        self.endEditing(true)
    }
    
    @IBAction func goClicked(_ sender: Any) {
        var status: String = ""
        if fhazCheckbox.isSelected {
            status = "fhaz"
        } else if rhazCheckbox.isSelected {
            status = "rhaz"
        } else if mastCheckbox.isSelected {
            status = "mast"
        } else if chemcamCheckbox.isSelected {
            status = "chemcam"
        } else if mahliCheckbox.isSelected {
            status = "mahli"
        } else if mardiCheckbox.isSelected {
            status = "mardi"
        } else if navcamCheckbox.isSelected {
            status = "navcam"
        } else if pancamCheckbox.isSelected {
            status = "pancam"
        } else if minitesCheckbox.isSelected {
            status = "minites"
        } else {
            status = ""
        }
        self.ignoreFilterData.accept(false)
        self.filterDataSubject.accept(status)
        self.endEditing(true)
        SwiftMessages.hide()
    }
    
    @IBAction func fhazClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = true
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func rhazClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = true
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func mastClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = true
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func chemcamClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = true
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func mahliClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = true
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func mardiClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = true
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func navcamClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = true
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func pancamClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = true
        self.minitesCheckbox.isSelected = false
    }
    
    @IBAction func minitesClicked(_ sender: Any) {
        self.fhazCheckbox.isSelected = false
        self.rhazCheckbox.isSelected = false
        self.mastCheckbox.isSelected = false
        self.chemcamCheckbox.isSelected = false
        self.mahliCheckbox.isSelected = false
        self.mardiCheckbox.isSelected = false
        self.navcamCheckbox.isSelected = false
        self.pancamCheckbox.isSelected = false
        self.minitesCheckbox.isSelected = true
    }
    
    @IBAction func ignoreButtonClicked(_ sender: Any) {
        self.ignoreFilterData.accept(true)
        self.filterDataSubject.accept("")
        self.endEditing(true)
        SwiftMessages.hide()
    }
    
    
    
}




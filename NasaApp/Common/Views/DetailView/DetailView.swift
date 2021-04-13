//
//  DetailView.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 11.04.2021.
//

import Foundation
import Reusable
import SwiftMessages
import RxSwift
import RxCocoa
import Kingfisher

final class DetailView: MessageView, NibLoadable {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var earthDateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var launchDateLabel: UILabel!
    @IBOutlet weak var landingDateLabel: UILabel!
    
    var detailData : PhotoModel? {
        didSet{
            guard let data = detailData else { return }
            detailImage.kf.setImage(with: URL(string: data.imgSrc?.replacingOccurrences(of: "http", with: "https") ?? ""))
            earthDateLabel.text = data.earthDate != nil ? "Earth Date => " + (data.earthDate ?? "") : ""
            nameLabel.text = data.rover?.name != nil ? "Name => " + (data.rover?.name ?? "") : ""
            cameraLabel.text = data.camera?.fullName != nil ? "Camera => " + (data.camera?.fullName ?? "") : ""
            statusLabel.text = data.rover?.status != nil ? "Status => " + (data.rover?.status ?? "") : ""
            launchDateLabel.text = data.rover?.launchDate != nil ? "Launch Date => " + (data.rover?.launchDate ?? "") : ""
            landingDateLabel.text = data.rover?.landingDate != nil ? "Landing Date => " + (data.rover?.landingDate ?? "") : ""
        }
    }
    var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
}

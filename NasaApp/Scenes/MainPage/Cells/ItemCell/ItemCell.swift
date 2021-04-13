//
//  ItemCell.swift
//  NasaApp
//
//  Created by Muhammed Sevük on 8.04.2021.
//

import UIKit
import Kingfisher
import Reusable

class ItemCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var cellImage: UIImageView!
    
    var cellData: PhotoModel? {
        didSet{
            let replaced = cellData?.imgSrc?.replacingOccurrences(of: "http", with: "https") ?? ""
            cellImage.kf.setImage(with: URL(string: replaced))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

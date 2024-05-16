//
//  HomeDepartmentCollectionViewCell.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import UIKit
import Kingfisher

class HomeDepartmentCollectionViewCell: UICollectionViewCell {
    
    static let spacing: CGFloat = 4
    
    static let defaultWidth: CGFloat = {
        return 120
    }()
    
    static let defaultHeight: CGFloat = {
        return 120
    }()
    
    static let numberOfColumn:Int = {
        return 1
    }()
            
    static let numberOfRow:Int = {
        return 4
    }()
        
    static func collectionItemWidth(collectionViewWidth: CGFloat, numberOfColumn: Int) -> CGFloat {
        let totalSpacing = (2 * Int(spacing)) + ((numberOfRow - 1) * 4)
        let itemSizeWidth = ((collectionViewWidth - CGFloat(totalSpacing)) / CGFloat(numberOfRow))
        return itemSizeWidth
    }
    
    static func collectionItemHeigth(collectionItemWidth:CGFloat) -> CGFloat{
        let hScale = collectionItemWidth / defaultWidth
        let itemSizeHeight = hScale * defaultHeight
        return itemSizeHeight
    }
    
    @IBOutlet var bgView: UIView! {
        didSet {
            bgView.setBorderAndRadius()
        }
    }
    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.setBorderAndRadius()
        }
    }
    @IBOutlet var nameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(name: String, imageUrl: String) {
        self.nameLabel.text = name
        
        let url = URL(string: imageUrl)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url)
                   
    }
    
}

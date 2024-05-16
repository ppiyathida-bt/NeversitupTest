//
//  HomeProductCollectionViewCell.xib.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import UIKit

class HomeProductCollectionViewCell: UICollectionViewCell {
    static let spacing: CGFloat = 4
    
    static let defaultWidth:CGFloat = {
        return 120
    }()
    
    static let defaultHeight:CGFloat = {
        return 150
    }()
    
    static let numberOfColumn:Int = {
        return 2
    }()
            
    static let numberOfRow:Int = {
        return 1
    }()
        
    static func collectionItemWidth(collectionViewWidth: CGFloat, numberOfColumn: Int) -> CGFloat {
        let totalSpacing = (2 * Int(spacing)) + ((numberOfColumn - 1) * 4)
        let itemSizeWidth = ((collectionViewWidth - CGFloat(totalSpacing)) / CGFloat(numberOfColumn))
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
            let cornerRadius: CGFloat = 10
            let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

            imageView.layer.cornerRadius = cornerRadius
            imageView.layer.maskedCorners = maskedCorners
        }
    }
    @IBOutlet var nameLable: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(name: String , imageUrl: String, desc: String, price: String) {
        self.nameLable.text = name
        self.descLabel.text = desc
        self.priceLabel.text = price
        
        let url = URL(string: imageUrl)
        imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(with: url)
    }
}

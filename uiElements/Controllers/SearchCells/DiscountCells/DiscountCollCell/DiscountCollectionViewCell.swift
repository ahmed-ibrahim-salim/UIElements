//
//  DiscountCollectionViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 12/04/2023.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    
    static let id = "DiscountCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var dicountLbl: UILabel!
    
    @IBOutlet weak var discountImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
        
        discountImg.layer.cornerRadius = 8

    }
    
}

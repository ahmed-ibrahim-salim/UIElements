//
//  ChefsCollectionViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 12/04/2023.
//

import UIKit

class ChefsCollectionViewCell: UICollectionViewCell {

    static let id = "ChefsCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var chefImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        chefImage.layer.cornerRadius = chefImage.frame.height / 2
        
        chefImage.layer.borderColor = UIColor.red.cgColor
        chefImage.layer.borderWidth = 1
    }
}

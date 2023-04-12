//
//  MealsCollectionViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 12/04/2023.
//

import UIKit

class MealsCollectionViewCell: UICollectionViewCell {

    static let id = "MealsCollectionViewCell"
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mealTypeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

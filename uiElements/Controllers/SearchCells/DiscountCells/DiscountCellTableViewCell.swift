//
//  DiscountCellTableViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 12/04/2023.
//

import UIKit

class DiscountCellTableViewCell: UITableViewCell {
    
    static let id = "DiscountCellTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        contentView.backgroundColor = .white
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        container.backgroundColor = .white
//
//        container.layer.cornerRadius = 10
        
        contentView.backgroundColor = UIColor.systemGray4
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: DiscountCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.id)
//        makeCollectionView()

    }

}


// MARK: Collection
extension DiscountCellTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscountCollectionViewCell.id, for: indexPath) as! DiscountCollectionViewCell
        
        
        cell.dicountLbl.text = "80%"
        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        vm.onePreferenceManager.itemSelected(index: indexPath.row)
//    }
    
}

extension DiscountCellTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

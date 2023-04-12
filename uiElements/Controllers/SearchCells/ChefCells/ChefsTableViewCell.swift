//
//  ChefsTableViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 12/04/2023.
//

import UIKit

class ChefsTableViewCell: UITableViewCell {

    static let id = "ChefsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.backgroundColor = UIColor.systemGray4
        container.backgroundColor = .white

        container.layer.cornerRadius = 10
        
//        collectionView.layer.borderColor = UIColor.black.cgColor
//        collectionView.layer.borderWidth = 1
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ChefsCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: ChefsCollectionViewCell.id)
        
    }
}


// MARK: Collection
extension ChefsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefsCollectionViewCell.id, for: indexPath) as! ChefsCollectionViewCell
        
        
        cell.chefImage.image = UIImage(systemName: "person")
        
        return cell
    }
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        vm.onePreferenceManager.itemSelected(index: indexPath.row)
    //    }
    
}

extension ChefsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

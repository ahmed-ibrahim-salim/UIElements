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
        contentView.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makeCollectionView()

    }
    
    // MARK: Collection
    var collectionView: UICollectionView! = {
        // Collection View
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.alwaysBounceHorizontal = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(UINib(nibName: DiscountCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: DiscountCollectionViewCell.id)
        
        
        //        collectionView.layer.borderWidth = 2
        //        collectionView.layer.borderColor = UIColor.black.cgColor
        return collectionView
    }()
    
    func makeCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints({make in
            make.edges.equalToSuperview()
            
        })
        collectionView.layoutIfNeeded()
        
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
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}

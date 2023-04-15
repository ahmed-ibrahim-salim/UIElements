

import UIKit

class MealsTableViewCell: UITableViewCell {
    
    static let id = "MealsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet weak var container: UIView!

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = UIColor.systemGray4
        container.backgroundColor = .white

        container.layer.cornerRadius = 10

        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: MealsCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: MealsCollectionViewCell.id)
//        makeCollectionView()
        
    }
    
    // MARK: Collection
//    var collectionView: UICollectionView! = {
//        // Collection View
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .clear
//        collectionView.contentInsetAdjustmentBehavior = .never
//        collectionView.alwaysBounceHorizontal = true
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.showsHorizontalScrollIndicator = false
//
//        collectionView.register(UINib(nibName: MealsCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: MealsCollectionViewCell.id)
//
//
//        //        collectionView.layer.borderWidth = 2
//        //        collectionView.layer.borderColor = UIColor.black.cgColor
//        return collectionView
//    }()
    
//    func makeCollectionView(){
//
//        addSubview(collectionView)
//
//        collectionView.snp.makeConstraints({make in
//            make.top.equalTo(self.frame.height - 30)
//
//            make.bottom.leading.trailing.equalToSuperview()
//        })
//
//        collectionView.layoutIfNeeded()
//
//    }
}


// MARK: Collection
extension MealsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealsCollectionViewCell.id, for: indexPath) as! MealsCollectionViewCell
        
        
        cell.mealTypeLbl.text = "lunch"
        
        return cell
    }
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        vm.onePreferenceManager.itemSelected(index: indexPath.row)
    //    }
    
}

extension MealsTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 3, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}

//
//  CollectionViewTableViewCell.swift
//  uiElements
//
//  Created by magdy khalifa on 22/11/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .systemPink
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

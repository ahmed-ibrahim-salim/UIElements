//
//  DownloadViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit

class DownloadsViewController: UIViewController {
        
    
    
    // MARK: Didload
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        navigationItem.title = "search"
        setupTableView()
    }
    
    // MARK: TableView
    var DISCOUNT_CELL = DiscountCellTableViewCell.id
    var MEALS_CELL = MealsTableViewCell.id
    var CHEFS_CELL = ChefsTableViewCell.id
    
    //
    lazy var tableView: UITableView = {
        //table header to scroll and not stick
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: DISCOUNT_CELL, bundle: nil), forCellReuseIdentifier: DISCOUNT_CELL)
        
        tableView.register(UINib(nibName: MEALS_CELL, bundle: nil), forCellReuseIdentifier: MEALS_CELL)
        tableView.register(UINib(nibName: CHEFS_CELL, bundle: nil), forCellReuseIdentifier: CHEFS_CELL)
        
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func setupTableView(){
        //        tableView
        //        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        
        
        tableView.snp.makeConstraints({ make in
            make.top.equalToSuperview()
            //            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
            make.bottom.equalToSuperview()
            
            
        })
    }
    
    var discount: String = "50%"
    var meals: [Meal] = [Meal(name: "green", price: 100),
                         Meal(name: "flesh", price: 200)]
    var chefs: [Chef] = [Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                                              Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                                              Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                                              Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                                              Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200),
                         Chef(name: "green", popularity: 100),
                         Chef(name: "flesh", popularity: 200)]
    
    //    //MARK: Helpers
    //    func getTableRows(row: Int)->Int{
    //            guard let tableCellBasedOnSegmented = TableSections(rawValue: row) else{ fatalError()}
    //            var rowsCount = 0
    //
    //            switch tableCellBasedOnSegmented {
    //            case .discount:
    //                rowsCount = 1
    //            case .meals:
    //                rowsCount = meals.count
    //            case .chefs:
    //                rowsCount = chefs.count
    //            }
    //            return rowsCount
    //        }
    
}
struct Chef{
    var name: String
    var popularity: Int
    
}
struct Meal{
    var name: String
    var price: Int
    
}
extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let tableCellBasedOnType = TableSections(rawValue: indexPath.row) else{ fatalError()}
        //        guard let tableCellBasedOnSegmented = TableCellWithSegmented(rawValue: 0) else{ fatalError()}
        var cell = UITableViewCell()
        
        switch tableCellBasedOnType {
        case .discount:
            // items cell
            guard let innerCell = tableView.dequeueReusableCell(withIdentifier: DiscountCellTableViewCell.id) as? DiscountCellTableViewCell else{fatalError()}
            
            //            innerCell.config(ingredient: ingredients[indexPath.row])
            cell = innerCell
            
            
        case .meals:
            // first cell - offers
            guard let innerCell = tableView.dequeueReusableCell(withIdentifier: MEALS_CELL) as? MealsTableViewCell else{fatalError()}
            
            //            innerCell.config(videoStep: videoSteps[indexPath.row], row: indexPath.row)
            cell = innerCell
            
        case .chefs:
            // first cell - offers
            guard let innerCell = tableView.dequeueReusableCell(withIdentifier: CHEFS_CELL) as? ChefsTableViewCell else{fatalError()}
            
            //            innerCell.config(videoStep: videoSteps[indexPath.row], row: indexPath.row)
            cell = innerCell
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let tableCellBasedOnType = TableSections(rawValue: indexPath.row) else{ fatalError()}
        
        switch tableCellBasedOnType {
        case .discount:
            return 150
        case .meals:
            
            return 150
            
        case .chefs:
            print(chefs.count)
            let imgHeight = 100.0
            let contentHeight = ceil(CGFloat(chefs.count / 3)) * imgHeight
            
            return contentHeight + (ceil(CGFloat(chefs.count / 3) * 32))
        }
    }
}

enum TableSections: Int{
    case discount
    case meals
    case chefs
}


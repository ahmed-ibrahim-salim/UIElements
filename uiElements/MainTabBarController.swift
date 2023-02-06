//
//  ViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        // add view controllers
        tabBarSetUp()
        
    }
    
    func tabBarSetUp(){
        let home = UINavigationController(rootViewController: HomeViewController())
        let upcoming = UINavigationController(rootViewController: UpcomingViewController())
        let search = UINavigationController(rootViewController: SearchViewController())
        let downloads = UINavigationController(rootViewController: DownloadsViewController())

        home.tabBarItem.image = UIImage(systemName: "house")
        upcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        search.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        home.title = "Home"
        upcoming.title = "Upcoming"
        search.title = "Top search"
        downloads.title = "Downloads"

        tabBar.tintColor = .label
        setViewControllers([home, upcoming, search, downloads], animated: true)
        
        selectedIndex = 1
    }
}



//func addNewView(){
//
//
//        var newView = UIView()
//        newView.translatesAutoresizingMaskIntoConstraints = false
//        newView.backgroundColor = .green
//        newView.layer.borderWidth = 20
//        newView.layer.borderColor = UIColor.blue.cgColor
//        newView.layer.cornerRadius = 20
//
//        let messageLbl = UILabel()
//        messageLbl.translatesAutoresizingMaskIntoConstraints = false
//        messageLbl.numberOfLines = 0
//        messageLbl.text = "Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello "
//        messageLbl.tintColor = .red
//
//
//newView.translatesAutoresizingMaskIntoConstraints = false
////        newView.backgroundColor = .green
////        newView.layer.borderWidth = 20
////        newView.layer.borderColor = UIColor.blue.cgColor
////        newView.layer.cornerRadius = 20
////        self.view.addSubview(newView)
////        newView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////        newView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
////        newView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
////        newView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
////
//
//        self.view.addSubview(messageLbl)
//        messageLbl.centerXAnchor.constraint(equalTo: newView.centerXAnchor).isActive = true
//        messageLbl.centerYAnchor.constraint(equalTo: newView.centerYAnchor).isActive = true
//        messageLbl.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 30).isActive = true
//        messageLbl.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -30).isActive = true
//
//    }
//
//@propertyWrapper
//public struct AutoLayout<T: UIView> {
//    public var wrappedValue: T {
//        didSet {
//            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//        }
//    }
//
//    public init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//        self.wrappedValue.translatesAutoresizingMaskIntoConstraints = false
//    }
//}

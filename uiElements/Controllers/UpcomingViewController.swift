//
//  UpcomingViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit
import SnapKit

class UpcomingViewController: UIViewController {
    
    // followers
    var followersCountLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "200.6K"
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        lbl.textAlignment = .center
        return lbl
    }()
    var followersLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "Followers"
        lbl.textColor = .gray
        lbl.textAlignment = .center
        
        return lbl
    }()
    var followersVStack: UIStackView! = {
        let stack = UIStackView()
        return stack
    }()
    var followerSeperatorView: UIView! = {
        let vw = UIView()
        vw.backgroundColor = .gray
        return vw
    }()
    var followersHstack: UIStackView! = {
        let stack = UIStackView()
        return stack
    }()
    // likes
    var likesCountLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "50.6K"
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        lbl.textAlignment = .center
        return lbl
    }()
    var likesLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "Likes"
        lbl.textColor = .gray
        lbl.textAlignment = .center
        
        return lbl
    }()
    var likesVStack: UIStackView! = {
        let stack = UIStackView()
        return stack
    }()
    var likesSeperatorView: UIView! = {
        let vw = UIView()
        vw.backgroundColor = .gray
        return vw
    }()
    var likesHStack: UIStackView! = {
        let stack = UIStackView()
        return stack
    }()
    
    // posts
    var postsCountLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "5.6K"
        lbl.font = UIFont.boldSystemFont(ofSize: 25.0)
        lbl.textAlignment = .center
        return lbl
    }()
    var postsLbl: UILabel! = {
        let lbl = UILabel()
        lbl.text = "Posts"
        lbl.textColor = .gray
        lbl.textAlignment = .center
        
        return lbl
    }()
    var postsVStack: UIStackView! = {
        let stack = UIStackView()
        return stack
    }()
    
    var wideHstack: UIStackView!
    
    var containerView: UIView! = {
        let vw = UIView()
        vw.layer.borderColor = UIColor.gray.cgColor
        vw.layer.borderWidth = 1
        vw.layer.cornerRadius = 10
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        makeStacks()
    }
    func makeSmallStack(countLbl: UILabel,
                        nameLbl: UILabel,
                        vStack: inout UIStackView,
                        seperator: UIView,
                        containerHStack: inout UIStackView)->UIStackView{

        vStack = UIStackView(arrangedSubviews: [countLbl, nameLbl])
        vStack.axis = .vertical
        
        countLbl.snp.makeConstraints({ make in
            make.height.equalToSuperview().multipliedBy(0.5)
        })
        
        containerHStack = UIStackView(arrangedSubviews: [vStack, seperator])
        seperator.snp.makeConstraints({ make in
            make.width.equalTo(2)
        })
        containerHStack.axis = .horizontal
        containerHStack.spacing = 5

        return containerHStack
    }
    
    func makeStacks(){
        // followers labels
        // making v stack for labels
        let followersStack = makeSmallStack(countLbl: followersCountLbl,
                                   nameLbl: followersLbl,
                                            vStack: &followersVStack,
                                            seperator: followerSeperatorView,
                                            containerHStack: &followersHstack)
        
        let likesStack = makeSmallStack(countLbl: likesCountLbl,
                                         nameLbl: likesLbl,
                                        vStack: &likesVStack,
                                            seperator: likesSeperatorView,
                                            containerHStack: &likesHStack)
        
        let postsVStack = UIStackView(arrangedSubviews: [postsCountLbl, postsLbl])
        postsVStack.axis = .vertical
        
        
        postsCountLbl.snp.makeConstraints({ make in
            make.height.equalToSuperview().multipliedBy(0.5)
        })
        

        wideHstack = UIStackView(arrangedSubviews: [followersStack, likesStack, postsVStack])
        
        wideHstack.axis = .horizontal
        wideHstack.distribution = .fillEqually
        
//        wideHstack.layer.borderWidth = 1
//        wideHstack.layer.borderColor = UIColor.red.cgColor

        containerView.addSubview(wideHstack)
                
        view.addSubview(containerView)
        
        wideHstack.snp.makeConstraints({ make in
            make.centerX.centerY.equalToSuperview()
        })
        
        containerView.snp.makeConstraints({ make in
            make.centerY.centerX.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.15)
            make.width.equalToSuperview().multipliedBy(0.9)

            //
        })
    }
    
    
}

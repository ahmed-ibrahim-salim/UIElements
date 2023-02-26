//
//  DownloadViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    let circleViewContainer: UIView = {
        let vw = UIView()
        vw.layer.borderWidth = 2
        vw.layer.borderColor = UIColor.black.cgColor
        return vw
    }()

    
    let circleView = CirclesView()
//    let tapView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        makeCircleContainer()
//        view.addSubview(tapView)
    }
    
    func makeCircleContainer(){
        
        view.addSubview(circleViewContainer)

        circleViewContainer.addSubview(circleView)
        
        circleView.snp.makeConstraints({ make in
            make.width.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-40)
            make.height.equalToSuperview()
//                .multipliedBy(0.5)
        })
        
        circleViewContainer.snp.makeConstraints({ make in
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
//                .offset(-40)
            make.height.equalToSuperview().multipliedBy(0.5)
        })
        

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        circleView.frame = view.frame


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        animate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        circleView.setNeedsDisplay()
    }
    
    // Animation
//    func animate() {
//        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: {
//            self.circleView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
//        }, completion: nil)
//    }
    
}

struct Category{
    var id: Int
    var color: UIColor
    var name: String
}

class CirclesView: UIView {
    
    var myColor = UIColor.red
    var borderColor = UIColor.black
    
    var categories = [Category(id: 0, color: .green, name: "ahmed"),
                      Category(id: 2, color: .red, name: "ahmed"),
                      Category(id: 3, color: .blue, name: "ahmed"),
                      Category(id: 4, color: .systemPink, name: "ahmed"),
                      Category(id: 5, color: .systemCyan, name: "ahmed"),
                      Category(id: 6, color: .systemMint, name: "ahmed"),
                      Category(id: 7, color: .systemTeal, name: "ahmed")]
    
    var usedRects: [CGRect] = []
    var usedDiameters: [CGFloat] = []
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setNeedsDisplay()
    }
    
    // MARK: Draw
    override func draw(_ rect: CGRect) {
        usedRects = []
        usedDiameters = []
                
        for category in categories {
            
            //1. Circle Diameter
            var diameter: CGFloat = 0
            
            //2. Circle Rect
            var rect: CGRect = .zero
            
            if category.id == 0{
                //1. Circle Diameter
                diameter = getDiameter(isFirst: true)
                
                //2. Circle Rect
                rect = getRect(diameter: diameter, isFirst: true)
                
            }else{
                
                
                diameter = getDiameter()
                
                //2. Circle Rect
                rect = getRect(diameter: diameter)
                
            }
            
            //3. Circle Path
            let circlePath = UIBezierPath(roundedRect: rect, cornerRadius: diameter / 2)
            
            //4. Circle Color
            category.color.setFill()
            
            //5. Draw Circle
            circlePath.fill()
            
            //6. Circle Border Color
            //            borderColor.setStroke()
            
            //7. Draw Circle Border
            //            circlePath.stroke()
            
        }
        
        
    }
    // MARK: Diameter
    func getDiameter(isFirst: Bool = false) -> CGFloat {
        var diameter = CGFloat(0)
        
        if isFirst{
            diameter = CGFloat(150)

        }else{
            diameter = CGFloat(90 + arc4random_uniform(10))
        }
        
        for usedDiameter in usedDiameters
        where usedDiameter == diameter {
            return getDiameter()
        }
        usedDiameters.append(diameter)
        return diameter
    }
    
    // MARK: Circle Rect
    func getRect(diameter: CGFloat, isFirst: Bool = false) -> CGRect {
        
        var posX: CGFloat = 0
        var posY: CGFloat = 0
        
        // created a rect
        // always intersects
        var rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        
        if isFirst{
            posX = CGFloat(UInt32(bounds.midX))
//            * 0.32
            posY = CGFloat(UInt32(bounds.midY))
//            * 0.32

            rect = CGRect(x: posX - diameter/2, y: posY - diameter/2, width: diameter, height: diameter)

            print(posX, "first")
            
        }else{
            
        // https://stackoverflow.com/questions/30318002/spawning-a-circle-in-a-random-spot-on-screen
            
            posX = CGFloat(arc4random_uniform(UInt32(bounds.maxX)))
            posY = CGFloat(arc4random_uniform(UInt32(bounds.maxY)))
            
            print(posX, "randomWidth")

            rect = CGRect(x: posX - diameter, y: posY - diameter, width: diameter, height: diameter)

        }
        
        
        if checkOutOfBounds(rect: rect){
            return getRect(diameter: diameter)

        }
        
//      check intersection
        for usedRect in usedRects where usedRect.intersects(rect) {
            // recursive call crashes

            return getRect(diameter: diameter)
        }
        
        usedRects.append(rect)

        return rect
    }
    
    //MARK: Out of bounds
    func checkOutOfBounds(rect: CGRect)->Bool{
        return rect.minX < bounds.minX || rect.minY < bounds.minX
    }
    
}

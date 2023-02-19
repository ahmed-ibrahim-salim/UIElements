//
//  DownloadViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    let circleView = CircleView()
//    let tapView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
    
        view.addSubview(circleView)
//        view.addSubview(tapView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleView.frame = view.frame

//        tapView.frame = view.frame

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
    var color: UIColor
    var name: String
}
class CircleView: UIView {
    
    var myColor = UIColor.red
    var borderColor = UIColor.black
    
    var categories = [Category(color: .green, name: "ahmed"),
                    Category(color: .red, name: "ahmed"),
                    Category(color: .blue, name: "ahmed"),
                    Category(color: .systemPink, name: "ahmed"),
                    Category(color: .systemCyan, name: "ahmed"),
                    Category(color: .systemMint, name: "ahmed"),
                    Category(color: .systemTeal, name: "ahmed")]
    
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
    
    override func draw(_ rect: CGRect) {
        usedRects = []
        usedDiameters = []
        for category in categories {
            
            //1. Circle Diameter
            let diameter = getDiameter()
            
            //2. Circle Rect
            let rect = getRect(diameter: diameter)
            
            //3. Circle Path
            let circlePath = UIBezierPath(roundedRect: rect, cornerRadius: diameter / 2)
            
            //4. Circle Color
            category.color.setFill()
            
            //5. Draw Circle
            circlePath.fill()
            
            //6. Circle Border Color
//            borderColor.setStroke()
            
            //7. Draw Circle Boder
//            circlePath.stroke()
        }
    }
    
    func getDiameter() -> CGFloat {
        let diameter = CGFloat(60 + arc4random_uniform(30))
        for usedDiameter in usedDiameters
        where usedDiameter == diameter {
            return getDiameter()
        }
        usedDiameters.append(diameter)
        return diameter
    }
    
    func getRect(diameter: CGFloat) -> CGRect {
        let randomWidth = CGFloat(arc4random_uniform(UInt32(self.bounds.size.width))) * 0.8
        let randomHeight = CGFloat(arc4random_uniform(UInt32(self.bounds.size.height))) * 0.4
        
        let rect = CGRect(x: randomWidth, y: randomHeight, width: diameter, height: diameter)
        
        for usedRect in usedRects
        where usedRect.intersects(rect) {
            return getRect(diameter: diameter)
        }
        usedRects.append(rect)
        return rect
    }
    
}

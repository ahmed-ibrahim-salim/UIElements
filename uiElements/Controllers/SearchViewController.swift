//
//  SearchViewController.swift
//  uiElements
//
//  Created by magdy khalifa on 21/11/2022.
//

import UIKit
import SnapKit


class SearchViewController: UIViewController {
    
    let mailTxtField: DesignableUITextField! = {
        let txtField = DesignableUITextField()
        
        txtField.leadingImage = UIImage(systemName: "xmark")
        txtField.leadingPadding = 10
        txtField.imageTintColor = .black
        txtField.placeholder = "Exambleemail@com"
//        txtField.leadingPadding = 10

        txtField.layer.borderColor = UIColor.systemGray5.cgColor
        txtField.layer.borderWidth = 1
        txtField.layer.cornerRadius = 10
        return txtField
    }()
    
    let passTxtField: DesignableUITextField! = {
        let txtField = DesignableUITextField()
        
        txtField.trailingPadding = 0
        txtField.trailingImage = UIImage(systemName: "eye")

//        containerControl
        
        txtField.leadingImage = UIImage(systemName: "pencil.circle.fill")
        txtField.leadingPadding = 10
        txtField.imageTintColor = .black
        txtField.isSecureTextEntry = true
        txtField.placeholder = "•••••••••"

//        txtField.leadingPadding = 10

        txtField.layer.borderColor = UIColor.systemGray5.cgColor
        txtField.layer.borderWidth = 1
        txtField.layer.cornerRadius = 10
        return txtField
    }()
    
    var textFieldsStack = UIStackView()
    
    var eyeControl: PasswordControl!
    var eyeControlShowPass = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        setConst()
        
        
        eyeControl = passTxtField.rightView as? PasswordControl
        eyeControl.addTarget(self, action: #selector(showPassword), for: .touchUpInside)
    }
    @objc func showPassword(){
        print("aaaaa")
        toggleShowPass()
    }
    func toggleShowPass(){
        eyeControlShowPass.toggle()
//        eyeControl.image = UIImage()
        if eyeControlShowPass{
            eyeControl.setNewImage(newImage: UIImage(systemName: "xmark")!)
        }else{
            eyeControl.useOldImage()
        }
    }
    func setConst(){
        
        
        textFieldsStack = UIStackView(arrangedSubviews: [mailTxtField, passTxtField])
        textFieldsStack.axis = .vertical
        textFieldsStack.distribution = .fillEqually
        textFieldsStack.spacing = 5
        
        
        view.addSubview(textFieldsStack)

        textFieldsStack.snp.makeConstraints({ make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.12)
        })
        
        
    }
}

class PasswordControl: UIControl{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    var imageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()
    
    var image: UIImage? {
        didSet {
            drawPassControl()
        }
    }
    var imageTintColor: UIColor = UIColor.lightGray {
        didSet {
            drawPassControl()
        }
    }
    func setNewImage(newImage: UIImage){
        imageView.image = newImage

    }
    func useOldImage(){
        imageView.image = image
    }
    func drawPassControl(){

        imageView.image = image

        // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
        imageView.tintColor = imageTintColor

        addSubview(imageView)
        
    }
    
}



//MARK: Custom Text
class DesignableUITextField: UITextField {
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leadingPadding
        return textRect
    }
    
    // Provides right padding for images
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= trailingPadding
        return textRect
    }
    
    @IBInspectable var leadingImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var trailingImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leadingPadding: CGFloat = 0
    @IBInspectable var trailingPadding: CGFloat = 0

    
    @IBInspectable var imageTintColor: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rtl: Bool = false {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        rightViewMode = UITextField.ViewMode.never
        rightView = nil
        leftViewMode = UITextField.ViewMode.never
        leftView = nil
        
        //trailing
        if let image = trailingImage {
            let passwordControl: PasswordControl = {
                let psC = PasswordControl(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                psC.image = image
                psC.imageTintColor = imageTintColor
                return psC
                
            }()
            
            
            
            if rtl {
                
                leftViewMode = UITextField.ViewMode.always
                leftView = passwordControl
            } else {
                rightViewMode = UITextField.ViewMode.always
                rightView = passwordControl
            }
        }
        
        
        // leading
        if let image = leadingImage {
            var stack = UIStackView()
            
            let seperatorView = {
                let vw = UIView()
                vw.backgroundColor = .gray
                return vw
            }()
            
            
            let imageView = {
                let imageView = UIImageView()
                imageView.image = image
                imageView.contentMode = .scaleAspectFit
                // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
                imageView.tintColor = imageTintColor
                return imageView
            }()
            
            let spacingView = UIView()
            
            stack = UIStackView(arrangedSubviews: [imageView, seperatorView, spacingView])
            
            stack.spacing = 2
            
//            stack.layer.borderColor = UIColor.black.cgColor
//            stack.layer.borderWidth = 1
            
            imageView.snp.makeConstraints({make in
                make.width.equalToSuperview().multipliedBy(0.7)
            })

            
            spacingView.snp.makeConstraints({make in
                make.width.equalToSuperview().multipliedBy(0.1)
            })

            stack.snp.makeConstraints({ make in
                make.width.equalTo(25)
            })
            
            if rtl {
                rightViewMode = UITextField.ViewMode.always
                rightView = stack
            } else {
                leftViewMode = UITextField.ViewMode.always
                leftView = stack
            }
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: imageTintColor])
    }
}

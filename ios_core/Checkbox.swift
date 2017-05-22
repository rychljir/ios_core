//
//  Checkbox.swift
//  SVPMap
//
//  Created by Jiri Rychlovsky on 10.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import UIKit
import PureLayout
/*
 
 UIButton object simulating behaviour of Checkbox
 
 */
public class Checkbox: UIButton {
    
    // Images
    let checkedImage = UIImage(named: "checkbox_checked")! as UIImage
    let uncheckedImage = UIImage(named: "checkbox")! as UIImage
    
    // Bool property
    public var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
                
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initCheckbox()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initCheckbox()
    }
    
    private func initCheckbox() {
        self.addTarget(self, action: #selector(Checkbox.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        self.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.titleLabel?.numberOfLines = 0
    }
    
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}

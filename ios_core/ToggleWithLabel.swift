//
//  SwitchWithText.swift
//  SVPMap
//
//  Created by Petr Mares on 11.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import UIKit

public class ToggleWithLabel: UIView {
    @IBOutlet weak var yes: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var no: UIButton!
    
    @IBAction func yesClick(_ sender: UIButton) {
        isChecked = 0
    }
    
    @IBAction func noClick(_ sender: UIButton) {
        isChecked = 1
    }
    
    
    // Bool property
    public var isChecked: Int = -1{
        didSet{
            if isChecked == 0{
                yes.backgroundColor = UIColor.white
                yes.setTitleColor(UIColor.black, for: .normal)
                no.backgroundColor = UIColor.black
                no.setTitleColor(UIColor.white, for: .normal)
                
            }else{
                yes.backgroundColor = UIColor.black
                yes.setTitleColor(UIColor.white, for: .normal)
                no.backgroundColor = UIColor.white
                no.setTitleColor(UIColor.black, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public class func instanceFromNib() -> UIView {
        return UINib(nibName: "ToggleWithLabel", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    public func setLabel(text: String){
        label.text = text
    }
    
    public func setEnabled(isEnabled: Bool){
            yes.isEnabled = isEnabled
            yes.isUserInteractionEnabled = isEnabled
            no.isEnabled = isEnabled
            no.isUserInteractionEnabled = isEnabled
    }
}

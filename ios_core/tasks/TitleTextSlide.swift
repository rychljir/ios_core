//
//  TitleTextSlide.swift
//  Satnav
//
//  Created by Petr Mares on 24.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

public class TitleTextSlide: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    public func initSlide(titleText title:String, description text:String){
        titleLabel.text = title
        textLabel.text = text
    }
    
   public func setBack(_ image:UIImage){
        background.image = image
    }
    
    public func setTextColor(_ color:UIColor){
        titleLabel.textColor = color
        textLabel.textColor = color
    }

}

//
//  TitleTextBottomImageSlide.swift
//  Satnav
//
//  Created by Petr Mares on 06.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

public class TitleTextBottomImageSlide: UIView {


    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    public func initSlide(taskTitle title:String, description descText: String, imageCont cont:UIImage){
        taskTitle.text = title
        img.image = cont

        let stringStyler =  StringStyler()
        desc.attributedText = stringStyler.convertText(inputText: descText)
    }
}

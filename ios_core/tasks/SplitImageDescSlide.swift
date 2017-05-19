//
//  SplitImageDescSlide.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

/*
 
 A task which shows a title and an image with a description
 
 */
public class SplitImageDescSlide: UIView {
    
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UILabel!


    public func initSlide(taskTitle title:String, description descText: String, imageCont cont:UIImage){
        taskTitle.text = title
        img.image = cont

        
        //desc.font = UIFont(name: "HelveticaNeue-Light", size: 12) //This is here to set up rest of the texts font
        let stringStyler =  StringStyler()
        
        desc.attributedText = stringStyler.convertText(inputText: descText)
    }

}

//
//  QuestionSlide.swift
//  SVPMap
//
//  Created by Jiri Rychlovsky on 12.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import Foundation


/*
 
 Class mapped on <questionslide>
 
 */
public class QuestionSlide{
    //children of <questionslide>
    public var components = [QuestionComponent]()
    
    //<questionslide title="">
    public var title: String?
    
    //<questionslide name="">
    public var name: String?
    
    //<questionslide type="">
    public var type: String?
    
    //<questionslide layout="">
    public var layout: String?
    
    //<questionslide timeLimit="">
    public var timelimit: String?

}

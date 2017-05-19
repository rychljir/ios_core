//
//  Task.swift
//  SVPMap
//
//  Created by Jiri Rychlovsky on 12.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import Foundation

/*
 
 Class mapped on <task>
 
 */
public class Task{
    //<location>, 2D array consists of {latitude, longitude}
    public var location = [Double]()
    
    //<questionslide>
    public var slides = [QuestionSlide]()
    
    //<task name="">
    public var name: String?
    
    //<header>
    public var header: String?
}

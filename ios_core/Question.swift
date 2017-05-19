//
//  Question.swift
//  SVPMap
//
//  Created by Jiri Rychlovsky on 12.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import Foundation

/*
 
 Classed mapped on <question>
 
 */
public class Question{
    
    //<question type="">
    public var type: String?
    
    //<question shuffle="">
    public var shuffle: String?
    
    //<question validate="">
    public var validate: String?
    
    //<description>
    public var description: String?
    
    //<variant>
    public var variants = [String]()
    
    //<variant valid="">
    public var answers = [String]()
}

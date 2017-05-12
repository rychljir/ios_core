//
//  QuestionSlide.swift
//  SVPMap
//
//  Created by Petr Mares on 12.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import Foundation

public class QuestionSlide{
    public var components = [QuestionComponent]()
    public var title: String?
    public var name: String?
    public var type: String?
    public var layout: String?
    public var timelimit: String?
    public var answers = [String]()
    public var texts = [String]()
    public var video: String?
}

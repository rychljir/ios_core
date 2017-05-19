//
//  ChapterProtocol.swift
//  ios_core
//
//  Created by Jiri Rychlovsky on 05.05.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import Foundation

/*
 
 Protocol for chapters, which wants to use ThreeImagesModalSlide
 
 */
public protocol ChapterProtocol {
   func showModal(image: UIImage, text: String)
}

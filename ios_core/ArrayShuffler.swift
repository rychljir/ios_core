//
//  ArrayShuffler.swift
//  ios_core
//
//  Created by Petr Mares on 21.05.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import Foundation

//shuffle values of an array
extension Array {
    mutating func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}

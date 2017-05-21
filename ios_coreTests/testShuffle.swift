//  Created by Jiri Rychlovsky on 21.05.17.
//  Copyright © 2017 Scientica. All rights reserved.
//


import XCTest
@testable import ios_core

class testShuffle: XCTestCase {
    
    var arr: [Int]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        arr = [Int]()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        arr = nil
        
        super.tearDown()
    }
    
    func testShuffling(){
        arr.append(1)
        arr.append(2)
        arr.append(3)
        arr.append(4)
        arr.append(5)
        
        var original = arr
        
        arr.shuffle()
        
        var shuffled = false
        
        for i in 0 ..< arr.count{
            if original?[i] != arr[i]{
                shuffled = true
            }
        }
        
        XCTAssert(shuffled, "Array was not shuffled")
    }
    
    
    func testEmpty(){
        arr.removeAll()
        do{
            try  arr.shuffle()
        }
        catch{
            XCTAssertThrowsError("Empty array shuffle fail")
        }
    }
}

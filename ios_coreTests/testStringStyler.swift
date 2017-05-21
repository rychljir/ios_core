//
//  testStringStyler.swift
//  ios_core
//
//  Created by Jiri Rychlovsky on 21.05.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import XCTest
@testable import ios_core

class testStringStyler: XCTestCase {
    
    var styler: StringStyler!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        styler = StringStyler()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        styler = nil
        
        super.tearDown()
    }
    
    func testStylerTagSub(){
        let testText = "<sub>test</sub>"
        
        let result = styler.convertText(inputText: testText)
        
        XCTAssertEqual(result.string, "test", "Tag <sub> wasnt removed!")
    }
    
    func testStylerTagSup(){
        let testText = "<sup>test</sup>"
        
        let result = styler.convertText(inputText: testText)
        
        XCTAssertEqual(result.string, "test", "Tag <sup> wasnt removed!")
    }
    
    func testStylerTagSmall(){
        let testText = "<small>test</small>"
        
        let result = styler.convertText(inputText: testText)
        
        XCTAssertEqual(result.string, "test", "Tag <small> wasnt removed!")
    }
    
    
    func testStylerTagU(){
        let testText = "<u>test</u>"
        
        let result = styler.convertText(inputText: testText)
        
        XCTAssertEqual(result.string, "test", "Tag <u> wasnt removed!")
    }
    
    func testStylerTagI(){
        let testText = "<i>test</i>"
        
        let result = styler.convertText(inputText: testText)
        
        XCTAssertEqual(result.string, "test", "Tag <i> wasnt removed!")
    }
    
    
}

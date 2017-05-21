//  Created by Jiri Rychlovsky on 21.05.17.
//  Copyright © 2017 Scientica. All rights reserved.
//


import XCTest
import AEXML
@testable import ios_core

class testParser: XCTestCase {
    var tasks = [Task]()
    var maxTries = 0
    var locations = [[Double]]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        do{
            let bundle = Bundle(for: testParser.self)
            let xmlPath = bundle.path(forResource: "testXML", ofType: "xml")
            let data = try? Data(contentsOf: URL(fileURLWithPath: xmlPath!))
            let opt = AEXMLOptions()
            let xmlDoc = try AEXMLDocument(xml: data!, options: opt)
            let parser = QuestionParser(xmlDocument: xmlDoc)
            tasks = parser.getTasks()
            maxTries = parser.getTries()
            for task in tasks {
                if task.location.count>0{
                    locations.append(task.location)
                }else{
                    locations.append([0,0])
                }
            }
        } catch {
            print("\(error)")
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tasks.removeAll()
        locations.removeAll()
        
        super.tearDown()
    }
    
    func testNumberOfTask(){
        let value = 5
        
        XCTAssertEqual(value, tasks.count, "Bad number of tasks")
        
    }
    
    func testMaxTries(){
        let value = 1
        
        XCTAssertEqual(value, maxTries, "Bad max tries")
    }
    
    func testLayouts(){
        let values = ["h_quest_quest", "v_quest_img", "v_quest_img", nil, nil, nil, nil, "v_quest_img"]
        
        var correct = true
        var slides = tasks[1].slides
        
        for i in 0 ..< values.count{
            if values[i] != slides[i].layout{
                correct = false
            }
        }
        
        XCTAssertTrue(correct, "Bad parsed layouts")
    }
    
    func testNumberOfQuestionSlides(){
        let values = [5, 8, 7, 6, 4]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != tasks[i].slides.count{
                correct = false
            }
        }
        
        XCTAssertTrue(correct, "Bad number of question slides")
    }
    
    func testHeader(){
        let values = ["Kralupské nádraží", "Technopark", "Jodlův dům", "Kostel", "Památník padlým"]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != tasks[i].header{
                correct = false
            }
        }
        
        XCTAssertTrue(correct, "Bad parsed headers")
    }
    
    func testTaskNames(){
        let values = ["task01", "task02", "task03", "task04", "task05"]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != tasks[i].name{
                correct = false
            }
        }
        
        XCTAssertTrue(correct, "Bad parsed task names")
    }
    
    func testQuestionSlideNames(){
        let values = ["firstScreen", "task01a", "task01b_map", "LockBeforeTaskFragment", "task01c"]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != tasks[0].slides[i].name{
                correct = false
            }
        }
        
        XCTAssertTrue(correct, "Bad parsed question slides names")
    }
    

    
    func testImages(){
        let value = "task03_jodl"
        
        var correct = true
        
        let image = tasks[2].slides[1].components[1] as! QuestionImage
        
            if value != image.name{
                correct = false
            }
        
        XCTAssertTrue(correct, "Bad parsed image")
    }
    
    
    func testQuestionAttributes(){
        let type = "singlechoice"
        let shuffle = "true"
        let validate = "true"
        
        let question = (tasks[2].slides[5].components[0] as! QuestionQuestions).values[0]
        
        var correct = true
        
        if type != question.type{
            correct = false
        }
        
        if shuffle != question.shuffle{
            correct = false
        }
        
        if validate != question.validate{
            correct = false
        }
        
        XCTAssertTrue(correct, "Bad parsed question attributes")
    }
    
    func testNumberOfVariants(){
        let value = 5
        
        let question = (tasks[4].slides[3].components[0] as! QuestionQuestions).values[0]
        
        var correct = true
        
        if value != question.variants.count{
            correct = false
        }
        
        
        XCTAssertTrue(correct, "Bad parsed numbar of variants")
    }
    
    func testVariants(){
        let values = ["slovenština", "maďarština", "polština", "chorvatština", "ruština"]
        
        let question = (tasks[2].slides[6].components[0] as! QuestionQuestions).values[0]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != question.variants[i]{
                correct = false
            }
        }
        
        
        XCTAssertTrue(correct, "Bad parsed values of variants")
        
    }
    
    func testVariantsValid(){
        let values = ["false", "false", "false", "true", "false"]
        
        let question = (tasks[2].slides[5].components[0] as! QuestionQuestions).values[0]
        
        var correct = true
        
        for i in 0 ..< values.count{
            if values[i] != question.answers[i]{
                correct = false
            }
        }
        
        
        XCTAssertTrue(correct, "Bad parsed attribute of variants")
    }
    
    func testOrderOfComponents(){
        let value = 2
        
        var counter = 0
        
        let components = tasks[2].slides[1].components
        
        if components[0] is QuestionDescription{
            counter = counter + 1
        }
        
        if components[1] is QuestionImage{
            counter = counter + 1
        }
        
        XCTAssertEqual(value, counter, "Bad order of components")
    }
    
}

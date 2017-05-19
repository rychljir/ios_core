//
//  v_quest_img.swift
//  SVPMap
//
//  Created by Jiri Rychlovsky on 08.05.17.
//  Copyright © 2017 Science in. All rights reserved.
//

import UIKit
import PureLayout
import DLRadioButton

/*
 
 Class for creating v_quest_img layout for <questionslide>
 
 */
public class v_quest_img: UIView{
    
    //flag for autolayout
    var shouldSetupConstraints = true
    
    //calling ViewController
    var parentVC: UIViewController?
    
    //number of maximum attempts to evalute task
    var maxTries = 1
    
    //counter of evaluation tries
    var currentTries = 0
    
    //<question type="">
    var qType: String!
    
    //container for placement of dynamic added views
    @IBOutlet weak var qContainer: UIView!
    
    //evaluation button
    @IBOutlet weak var evalBtn: UIButton!

    //possible instances of question types
    var singleChoice: SingleChoiceQuestion?
    var multiChoice: MultichoiceQuestion?
    var interval: IntervalQuestion?
    var filltext: FilltextQuestion?
    var number: NumberQuestion?
    var toggle: ToggleButtonsQuestion?

    //dynamic creation of <questionslide>
    public func initSlide(question: QuestionSlide, maximumTries: Int,  callingViewController: UIViewController){
        parentVC = callingViewController
        
        //for every element of <question>
        for element in question.components{
            
            //<description>
            if let descElement = element as? QuestionDescription{
                let title = UILabel(frame: CGRect.zero)
                title.text = descElement.value
                title.textColor = UIColor.white
                title.font = UIFont.systemFont(ofSize: CGFloat(25))
                title.lineBreakMode = NSLineBreakMode.byWordWrapping
                title.numberOfLines = 0
                qContainer.addSubview(title)
            }
            
            //<questions>
            if let questionsElement = element as? QuestionQuestions{
                if questionsElement.values.count>0{
                    let q = questionsElement.values[0]
                    
                    //<question type="">
                    qType = q.type
                    //<description>
                    if let desc = q.description{
                        let qTitle = UILabel(frame: CGRect.zero)
                        qTitle.text = desc
                        qTitle.textColor = UIColor.white
                        qTitle.font = UIFont.systemFont(ofSize: CGFloat(25))
                        qTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
                        qTitle.numberOfLines = 0
                        qContainer.addSubview(qTitle)
                    }
                    //<question shuffle="">
                    if let shuffle = q.shuffle{
                        if shuffle == "true"{
                            shuffleVariants(question: q)
                        }
                    }
                    
                    //<question type="">
                    if let type = qType{
                        switch type {
                        case "singlechoice":
                            singleChoice = SingleChoiceQuestion(question: q)
                            qContainer.addSubview(singleChoice!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        case "multichoice":
                            multiChoice = MultichoiceQuestion(question: q)
                            qContainer.addSubview(multiChoice!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        case "intervalquestion":
                            interval = IntervalQuestion(question: q)
                            qContainer.addSubview(interval!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        case "fillText":
                            filltext = FilltextQuestion(question: q)
                            qContainer.addSubview(filltext!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        case "numberquestion":
                            number = NumberQuestion(question: q)
                            qContainer.addSubview(number!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        case "togglebuttonsgrid":
                            toggle = ToggleButtonsQuestion(question: q)
                            qContainer.addSubview(toggle!)
                            qContainer.bringSubview(toFront: self)
                            qContainer.isUserInteractionEnabled = true
                            break
                        default:
                            break
                        }
                    }
                    if let val = q.validate{
                        if val == "true"{
                            evalBtn!.addTarget(self, action: #selector(v_quest_img.evaluateTask), for: UIControlEvents.touchUpInside)
                        }else{
                            evalBtn!.isHidden = true
                        }
                    }
                }
            }
            //<images>
            if let imgElement = element as? QuestionImage{
                    let imageView = UIImageView(frame: CGRect.zero)
                    imageView.image = UIImage(named: imgElement.name)
                    imageView.contentMode = UIViewContentMode.scaleAspectFit
                    qContainer.addSubview(imageView)
            }
        }
        
        evalBtn!.isHidden = true
        for element in question.components{
            if element is QuestionQuestions{
                evalBtn!.isHidden = false
            }
        }

    }
    
    //shuffle variants in question
    func shuffleVariants(question q: Question){
        var shuffler = [Int]()
        for i in 0 ..< q.variants.count{
            shuffler.append(i)
        }
        
        shuffler.shuffle()
        
        var tempVariants = [String]()
        var tempAnswers = [String]()
        for i in 0 ..< shuffler.count{
            tempVariants.append(q.variants[shuffler[i]])
            tempAnswers.append(q.answers[shuffler[i]])
        }
        q.variants = tempVariants
        q.answers = tempAnswers
        
    }
    
    //autolayout constraints
    override public func updateConstraints() {
        if(shouldSetupConstraints) {
            if(qContainer.subviews.count>0){
                qContainer.subviews[0].autoPinEdge(toSuperviewEdge: .left, withInset: CGFloat(0))
                qContainer.subviews[0].autoPinEdge(toSuperviewEdge: .top, withInset: CGFloat(0))
                qContainer.subviews[0].autoPinEdge(toSuperviewEdge: .right, withInset: CGFloat(0))
            }
            
            for i in 1 ..< qContainer.subviews.count{
                    qContainer.subviews[i].autoPinEdge(toSuperviewEdge: .left, withInset: CGFloat(0))
                    qContainer.subviews[i].autoPinEdge(.top, to: .bottom, of: qContainer.subviews[i-1], withOffset: CGFloat(20))
                    qContainer.subviews[i].autoPinEdge(toSuperviewEdge: .right, withInset: CGFloat(0))
            }
        
            qContainer.autoPinEdge(.bottom, to: .bottom, of: qContainer.subviews[qContainer.subviews.count-1])
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    //action after click on Evaluate button
    @IBAction private func evaluateTask(eval : UIButton) {
        currentTries = currentTries + 1
        switch qType! {
        case "singlechoice":
            let correct = singleChoice!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    singleChoice!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                singleChoice!.completeTask()
                evalBtn!.isEnabled = false
            }
            break
        case "multichoice":
            let correct = multiChoice!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    multiChoice!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                multiChoice!.completeTask()
                evalBtn!.isEnabled = false
            }
        case "intervalquestion":
            let correct = interval!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    interval!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                interval!.completeTask()
                evalBtn!.isEnabled = false
            }
            break
        case "fillText":
            let correct = filltext!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    filltext!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                filltext!.completeTask()
                evalBtn!.isEnabled = false
            }
            break
        case "numberquestion":
            let correct = number!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    number!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                number!.completeTask()
                evalBtn!.isEnabled = false
            }
            break
        case "togglebuttonsgrid":
            let correct = toggle!.evaluate()
            if !correct{
                parentVC?.showToast(message: "Ups, tak to se úplnē nepovedlo.")
                if currentTries >= maxTries{
                    toggle!.completeTask()
                    evalBtn!.isEnabled = false
                }
            }else{
                parentVC?.showToast(message: "Správnē!")
                toggle!.completeTask()
                evalBtn!.isEnabled = false
            }
        default:
            break
        }
    }
}


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



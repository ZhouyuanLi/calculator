//
//  ViewController.swift
//  Calculator
//
//  Created by Minjie Li on 6/28/16.
//  Copyright © 2016 Minjie Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingNumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber == false {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        } else {
            display.text = display.text! + digit
        }
        print("digit = \(digit)")
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        let operation = sender.currentTitle!
        switch operation {
            case "+":
                performOperation({(op1, op2) in op1 + op2})
            case "-":
                performOperation({(op1, op2) in op2 - op1})
            case "✕":
                performOperation({(op1, op2) in op1 * op2})
            case "÷":
                performOperation({(op1, op2) in op2 / op1})
            case "√":
                performOperation2({op1 in sqrt(op1)})
            default:
                break
        }
    }
    
    func performOperation(operation : (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation2(operation : Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
            userIsInTheMiddleOfTypingNumber = false
        }
        
    }
}


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
    var userIsInTheMiddleOfTypingNumber: Bool = false
    
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
    
    @IBAction func enter(sender: UIButton) {
    }
}

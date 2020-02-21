//
//  ViewController.swift
//  CalculatorApp2
//
//  Created by Tuomas Käyhty on 21/02/2020.
//  Copyright © 2020 Tuomas Käyhty. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    var numberOnScreen: Double = 0;
    var previousNUmber: Double = 0;
    var performingMath = false
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 19 {
            previousNUmber = Double(label.text!)!
            
            if sender.tag == 12 // SquareRoot
            {
                label.text = "√"
            }
            else if sender.tag == 13 // square
            {
                label.text = "x^"
            }
            else if sender.tag == 14 // Percent
            {
                label.text = "%"
            }
            if sender.tag == 15 // Divide
            {
                label.text = "/"
            }
            else if sender.tag == 16 // Multiply
            {
                label.text = "x"
            }
            else if sender.tag == 17 // Minus
            {
                label.text = "-"
            }
            else if sender.tag == 18 // Plus
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 19
        {
            if operation == 12 {
                label.text = String(sqrt(numberOnScreen))
            }
            else if operation == 13 {
                label.text = String(pow(previousNUmber, numberOnScreen))
            }
            else if operation == 14 {
                label.text = String(previousNUmber / 100)
            }
            else if operation == 15 {
                label.text = String(previousNUmber / numberOnScreen)
            }
            else if operation == 16 {
                label.text = String(previousNUmber * numberOnScreen)
            }
            else if operation == 17 {
                label.text = String(previousNUmber - numberOnScreen)
            }
             else if operation == 18 {
                label.text = String(previousNUmber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNUmber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


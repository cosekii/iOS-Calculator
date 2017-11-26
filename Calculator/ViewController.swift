//
//  ViewController.swift
//  Calculator
//
//  Created by Shuo Huang on 8/26/17.
//  Copyright © 2017 Shuo Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var addButton: UIButton!

    var hasDecimalPoint = false
    var isPartialResult = false
    var op1 = 0.0
    var op2 = 0.0
    var operation = ""
    var result = 0.0
    
    
    @IBAction func clear(_ sender: UIButton) {
        clearBorder()
        hasDecimalPoint = false
        isPartialResult = false
        op1 = 0.0
        op2 = 0.0
        operation = ""
        result = 0.0
        resultsLabel.text = "0"
    }
    
    @IBAction func getNegative(_ sender: UIButton) {
        var original = resultsLabel.text!
        if original != "0" {
            if original.characters.first! == "-" {
                original.remove(at: original.startIndex)
                resultsLabel.text = original
            }
            else {
                resultsLabel.text = "-" + original
            }
        }
    }
    
    @IBAction func takePercent(_ sender: UIButton) {
        op1 = Double(resultsLabel.text!)!
        op2 = 100
        result = op1 / op2
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultsLabel.text = String(Int(result))
        }
        else {
            resultsLabel.text = String(result)
        }
        op1 = result
    }
    
    @IBAction func evaluate(_ sender: UIButton) {
        clearBorder()
        if isPartialResult == false {
            op2 = Double(resultsLabel.text!)!
        }
        switch operation {
        case "+":
            result = op1 + op2
        case "-":
            result = op1 - op2
        case "✕":
            result = op1 * op2
        case "÷":
            result = op1 / op2
        default:
            return
        }
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultsLabel.text = String(Int(result))
        }
        else {
            resultsLabel.text = String(result)
        }
        op1 = result
        isPartialResult = true
        hasDecimalPoint = false
    }
    
    func clearBorder() {
        divButton.layer.borderWidth = 0
        mulButton.layer.borderWidth = 0
        subButton.layer.borderWidth = 0
        addButton.layer.borderWidth = 0
    }
    
    @IBAction func addOperation(_ sender: UIButton) {
        clearBorder()
        op1 = Double(resultsLabel.text!)!
        op2 = op1
        isPartialResult = true
        hasDecimalPoint = false
        operation = sender.titleLabel!.text!;
        sender.layer.borderWidth = 5
        sender.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @IBAction func numberButtonWasPressed(_ sender: UIButton) {
        if isPartialResult == true {
            resultsLabel.text = "0"
            isPartialResult = false
        }
        let num : String = sender.titleLabel!.text!
        if resultsLabel.text == "0" {
            if num != "." && num != "0"{
                resultsLabel.text = num
            }
            else if num == "." && hasDecimalPoint == false{
                resultsLabel.text = "0."
                hasDecimalPoint = true
            }
        }
        else {
            if num == "." && hasDecimalPoint == false {
                resultsLabel.text = resultsLabel.text! + num
                hasDecimalPoint = true
            }
            else if num != "." {
                resultsLabel.text = resultsLabel.text! + num
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resultsLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


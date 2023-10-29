//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text! ) else{
                fatalError("Cannot convert display label text to Double.")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        //        guard let number = Double(displayLabel.text! ) else{
        //            fatalError("Cannot convert display label text to Double.")
        //        }
        
        calculator.setNumber( displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
//        if let calcMethod = sender.currentTitle {
//            if calcMethod == "+/-" {
//                displayValue = displayValue * -1
//            }else if calcMethod == "AC" {
//                displayLabel.text = "0"
//            }else if calcMethod == "%"{
//                displayValue = displayValue * 0.01
//                
//                
//            }
//            
//        }
    }
        
        @IBAction func numButtonPressed(_ sender: UIButton) {
            
            if let numValue = sender.currentTitle{
                if isFinishedTypingNumber {
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                }else{
                    if numValue == "."{
                        
                        //                            guard let currentDisplayValue = Double(displayLabel.text!) else{
                        //                                fatalError("Cannot convert display label text to a Double")
                        //                            }
                        
                        let isInt = floor(displayValue) == displayValue
                        
                        if !isInt {
                            return
                        }
                    }
                    displayLabel.text = displayLabel.text! + numValue
                }
                
            }
            
        }
    
    
    
}

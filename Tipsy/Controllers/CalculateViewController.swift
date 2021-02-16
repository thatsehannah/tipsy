//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var numberOfPeople = 2
    var split = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let selectedText = sender.currentTitle!
        let stringifiedValue = String(selectedText.dropLast())
        let rawTipValue = Double(stringifiedValue)!
        
        tip = rawTipValue / 100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    
        let billTotalText = billTextField.text!
        if (billTotalText != ""){
            let billTotal = Double(billTotalText)!
            split = billTotal * (tip + 1) / Double(numberOfPeople)
            print(String(format: "%.2f", split))
        }
        
        
    }
    
}


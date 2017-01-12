//
//  ViewController.swift
//  Final Grade Calculator
//
//  Created by Neil Kulkarni on 1/9/17.
//  Copyright © 2017 Neil Kulkarni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentGradeField: UITextField!
    @IBOutlet weak var desiredGradeField: UITextField!
    @IBOutlet weak var weightFinalField: UITextField!
    @IBOutlet weak var gradeNeededLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var calculateGradeNeededButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onCalculateGrade(_ sender: Any) {
        print("Calculating!")
        
        guard let currentGrade = currentGradeField.text, !currentGrade.isEmpty else {
            errorLabel.isHidden = false
            errorLabel.text = "Please enter your current grade."
            return
        }
        
        guard let desiredGrade = desiredGradeField.text, !desiredGrade.isEmpty else {
            errorLabel.isHidden = false
            errorLabel.text = "Please enter your desired grade."
            return
        }
        
        guard let weightFinal = weightFinalField.text, !weightFinal.isEmpty else {
            errorLabel.isHidden = false
            errorLabel.text = "Please enter the weight of your final."
            return
        }
        
        let currentGradeValue = Double(currentGrade)!
        let desiredGradeValue = Double(desiredGrade)!
        let weightFinalValue = Double(weightFinal)!
        
        // unweightedGrade = ((100 - weightFinal) / 100) * currentGrade
        // differenceGrade = gradeWanted - gradeHave
        // diffGrade / weightFinal * 100
        
        let unweightedGrade = ((100 - weightFinalValue) / 100) * currentGradeValue
        let differenceGrade = desiredGradeValue - unweightedGrade
        let gradeNeeded = differenceGrade / weightFinalValue * 100
    
        gradeNeededLabel.text = "\(gradeNeeded)%"
    }
}


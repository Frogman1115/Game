//
//  ViewController.swift
//  Games F
//
//  Created by period4 on 4/5/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var squareLabelOne: UILabel!
    @IBOutlet weak var squareLabelTwo: UILabel!
    @IBOutlet weak var squareLabelThree: UILabel!
    @IBOutlet weak var squareLabelFour: UILabel!
    @IBOutlet weak var squareLabelFive: UILabel!
    @IBOutlet weak var squareLabelSix: UILabel!
    @IBOutlet weak var squareLabelSeven: UILabel!
    @IBOutlet weak var squareLabelEight: UILabel!
    @IBOutlet weak var squareLabelNine: UILabel!
    var allLabels: [UILabel] = []
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var myView: UIView!
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    turnLabel.text = "X"
    
    allLabels = [squareLabelOne, squareLabelTwo, squareLabelThree, squareLabelFour, squareLabelFive, squareLabelSix, squareLabelSeven, squareLabelEight, squareLabelNine]
    
    func checkForWinner() {

        if squareLabelOne.text == squareLabelTwo.text && squareLabelTwo.text == squareLabelThree.text  && squareLabelOne.text != "" {
             
        }
        if squareLabelOne.text == squareLabelFour.text && squareLabelFour.text == squareLabelSeven.text && squareLabelOne.text != "" {
       
        }
        if squareLabelFour.text == squareLabelFive.text && squareLabelFive.text == squareLabelSix.text && squareLabelFour.text != "" {

        }
        if squareLabelSeven.text == squareLabelEight.text && squareLabelEight.text == squareLabelNine.text && squareLabelSeven.text != "" {
   
        }
        if squareLabelTwo.text == squareLabelFive.text && squareLabelFive.text ==
            squareLabelEight.text && squareLabelTwo.text != ""{
    
        }
        if squareLabelThree.text == squareLabelSix.text && squareLabelSix.text == squareLabelNine.text && squareLabelThree.text != "" {
            
        }
        if squareLabelOne.text == squareLabelFive.text &&
            squareLabelFive.text == squareLabelNine.text && squareLabelOne.text != "" {
            
        }
        if squareLabelThree.text == squareLabelFive.text && squareLabelFive.text == squareLabelSeven.text && squareLabelThree.text != "" {
            
        }
    alert()
    }
  
}



    func placeInToLabel(myLabel: UILabel) {

            if myLabel.text == ""{
                if turnLabel.text == "X" {
                myLabel.text = turnLabel.text
                turnLabel.text = "O"

            }
            else {
                
            myLabel.text = turnLabel.text
                turnLabel.text = "X"
            
            
            
            
             }
         }
    }
   
    func alert() {
        let winningAlert = UIAlertController (title: "YOU WON", message: "GOOD ONE", preferredStyle: .alert)
        present(winningAlert, animated: true, completion: nil)
        
    }
    
    
    
    
    
func resetButton(sender: UIButton) {
    for label in allLabels{
        label.text = ""
    }
}
   
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        let selectedPoint = sender.location(in: myView)
        for label in allLabels {
            if label.frame.contains(selectedPoint) {
    placeInToLabel(myLabel: label)
    
            }
    
        }
    }
}

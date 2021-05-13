//
//  ViewController2.swift
//  Games F
//
//  Created by period4 on 4/27/21.
//

import UIKit
import AVFoundation

class ViewController2: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var brickOne: UIView!
    @IBOutlet weak var brickTwo: UIView!
    @IBOutlet var brickThree: UIView!
    @IBOutlet weak var brickFour: UIView!
    @IBOutlet weak var brickFive: UIView!
    @IBOutlet weak var brickSix: UIView!
    @IBOutlet weak var brickSeven: UIView!
    @IBOutlet weak var brickEight: UIView!
    @IBOutlet weak var brickNine: UIView!
    @IBOutlet weak var brickTen: UIView!
    @IBOutlet weak var ballLabel: UIView!
    @IBOutlet weak var paddleLabel: UIView!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    
    

    
    var allBricks = [UIView]()
    var dynamicAnimator : UIDynamicAnimator!
    var pushBehavior : UIPushBehavior!
    var collisionBehavior : UICollisionBehavior!
    var ballDynamicBehavior : UIDynamicItemBehavior!
    var paddleDynamicBehavior : UIDynamicItemBehavior!
    var bricksDynamicBehavior : UIDynamicItemBehavior!
    
    var brickCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballLabel.layer.cornerRadius = 12
        allBricks = [brickOne,brickTwo,brickThree,brickFour,brickFive,brickSix,brickSeven,brickEight,brickNine,brickTen]
        ballLabel.isHidden = true
        paddleLabel.isHidden = true
    }
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        paddleLabel.center = CGPoint (x: sender.location(in: view).x, y: paddleLabel.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleLabel)
    }
    func dynamicBehavior()  {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items: [ballLabel], mode: .instantaneous)
        pushBehavior.pushDirection = CGVector(dx: 0.7, dy: 0.7)
        pushBehavior.active = true
        pushBehavior.magnitude = 0.2
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior (items: [ballLabel, paddleLabel] + allBricks)
        collisionBehavior.collisionMode = .everything
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicAnimator.addBehavior(collisionBehavior)
        collisionBehavior.collisionDelegate = self
      
        ballDynamicBehavior = UIDynamicItemBehavior(items: [ballLabel])
        ballDynamicBehavior.allowsRotation = true
        ballDynamicBehavior.elasticity = 1
        ballDynamicBehavior.resistance = 0
        ballDynamicBehavior.friction = 0
        dynamicAnimator.addBehavior(ballDynamicBehavior)
        
        paddleDynamicBehavior = UIDynamicItemBehavior(items: [paddleLabel])
        paddleDynamicBehavior.allowsRotation = false
        paddleDynamicBehavior.density = 1000
        paddleDynamicBehavior.elasticity = 1
        dynamicAnimator.addBehavior(paddleDynamicBehavior)
    
       
    }
    @IBAction func startButton(_ sender: UIButton) {
        dynamicBehavior()
        sender.isHidden = true
        ballLabel.isHidden = false
        paddleLabel.isHidden = false
   let sound = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: "What a legend")
        sound.speak(utterance)
    
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        for brick in allBricks {
        if item1.isEqual(ballLabel) && item2.isEqual(brick) {
            brick.isHidden = true
            collisionBehavior.removeItem(brick)
            brickCount = brickCount - 1
            print(brickCount)
            
            if brickCount == 0 {
                let winningAlert = UIAlertController (title: "Congrats you won", message: "Try Again?", preferredStyle: .alert)
                present(winningAlert, animated: true, completion: nil)
                collisionBehavior.removeItem(ballLabel)
                ballLabel.isHidden = true
                startButtonOutlet.isHidden = false
                ballDynamicBehavior.resistance = 1000
                brickCount = 10
                for bricks in allBricks {
                    bricks.isHidden = false
                
                }
                }
        }
        }
    }
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        if p.y > paddleLabel.center.y {
        alert()
        }
    }
    func alert() {
        let losingAlert = UIAlertController (title: "YOU LOSE", message: "TRY AGAIN", preferredStyle: .alert)
        present(losingAlert, animated: true, completion: nil)
        
    }



}

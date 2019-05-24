//
//  ViewController.swift
//  Animation-NC1
//
//  Created by Andre Elandra on 17/05/19.
//  Copyright © 2019 Andre Elandra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var bulatFrame: UIView!
    
    var tapGesture = UITapGestureRecognizer()
    var swipeGesture = UISwipeGestureRecognizer()
    
//    var angkaRandomX: CGFloat!
//    var angkaRandomY: CGFloat!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var itemBehaviour: UIDynamicItemBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bulatFrame.layer.cornerRadius = bulatFrame.frame.width/2
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(bulatSudahDitekan(_:)))
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(bulatSwiped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        swipeGesture.direction = .up
        swipeGesture.numberOfTouchesRequired = 1
        bulatFrame.addGestureRecognizer(tapGesture)
        bulatFrame.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
        gravityAction()
        
    }
    
    func gravityAction(){
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [bulatFrame])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [bulatFrame])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        itemBehaviour = UIDynamicItemBehavior(items: [bulatFrame])
        itemBehaviour.elasticity = 0.5
        itemBehaviour.charge = 1.0
        animator.addBehavior(itemBehaviour)
    }
    
    @objc func bulatSudahDitekan(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: ({
            self.moveRandom(self.bulatFrame)
            self.colorRandom(self.bulatFrame)
            self.gravityAction()
        }), completion: nil)

    }
    
       @objc func bulatSwiped(_ sender: UISwipeGestureRecognizer) {
            UIView.animate(withDuration: 1, animations: ({
                self.moveRandom(self.bulatFrame)
                self.colorRandom(self.bulatFrame)
                self.gravityAction()
            }), completion: nil)
        
    }
        
    
//    func move(_ view: UIView){
//        self.bulatFrame.frame = CGRect(x: self.angkaRandomX, y: self.angkaRandomY, width: self.bulatFrame.frame.width, height: self.bulatFrame.frame.height)
//        self.bulatFrame.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
//    }
    
    func moveRandom(_ view: UIView) {
        let itemXPosition = CGFloat.random(in: 10...400)
        let itemYPosition = CGFloat.random(in: 44...400)
        
        bulatFrame.center.x = itemXPosition
        bulatFrame.center.y = itemYPosition
    }
    
        func colorRandom(_ view: UIView){
            
        let colorRed = CGFloat.random(in: 0.0000000000...1)
        let colorGreen = CGFloat.random(in: 0.0000000000...1)
        let colorBlue = CGFloat.random(in: 0.0000000000...1)
            
        bulatFrame.backgroundColor = UIColor.init(displayP3Red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
        
            
            
    }
    
}


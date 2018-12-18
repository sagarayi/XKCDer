//
//  ViewController.swift
//  XKCDer
//
//  Created by smadhuay on 06/12/18.
//  Copyright © 2018 sagarayi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var theButton: UIButton!
    var firstImageFrame : CGSize!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImageViews()
        gestureInit()
        self.firstImageFrame = self.firstImageView.frame.size
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func gestureInit()
    {
        let rightSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(rightSwipedImage))
        rightSwipe.direction = UISwipeGestureRecognizer.Direction.right
        let leftSwipe = UISwipeGestureRecognizer.init(target: self, action: #selector(leftSwipedImage))
        leftSwipe.direction = UISwipeGestureRecognizer.Direction.left
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPanGesture(gestureRecognizer:)))
        
        
        firstImageView.gestureRecognizers = [panGesture]
        
    }
    
    @objc func onPanGesture(gestureRecognizer : UIPanGestureRecognizer)
    {
        
        let touchLocation = gestureRecognizer.location(in: self.view)
        
//        [UIView.animate(withDuration: 12, delay: 0, options: [.repeat, .autoreverse], animations: {
//            UIView.setAnimationRepeatCount(3)
//            self.firstImageView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 1, 3)
//        }) { (completed) in
//            // completion
//        }]
        [UIView .animate(withDuration: 0.0, animations: {
//            self.firstImageView.contentOffset.x = 20
            self.firstImageView.frame = CGRect(x: touchLocation.x - (self.firstImageFrame.width/2) , y: touchLocation.y - (self.firstImageFrame.height/2), width: self.firstImageFrame.width, height: self.firstImageFrame.height)
//            self.firstImageView!.transform = CATransform3DMakeRotation(CGFloat(M_PI), CGFloat(1.0), CGFloat(0.0), CGFloat(0.0))
        })]
    }
    @objc func rightSwipedImage()
    {
//        [UIView .animate(withDuration: 0.5, animations: {
////            self.firstImageView.transform = CGAffineTransform(rotationAngle: 60)
////            self.firstImageView.frame = CGRect.inset(self.firstImageView.frame.origin.x,self.firstImageView.frame.origin.y,50,50)
//
//        })]
        NSLog("right swiped")
    }
    @objc func leftSwipedImage()
    {
//        [UIView .animate(withDuration: 0.5, animations: {
////            self.firstImageView.transform = CGAffineTransform(rotationAngle: -120)
//            //            self.firstImageView.frame = CGRect.inset(self.firstImageView.frame.origin.x,self.firstImageView.frame.origin.y,50,50)
//
//        })]
        NSLog("left swiped")
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        let touch = touches.first!
//        let touchLocation = touch.location(in: self.view)
//
//
//        [UIView .animate(withDuration: 0.5, animations: {
//           self.firstImageView.frame = CGRect(x: touchLocation.x - (self.firstImageFrame.width/2) , y: touchLocation.y - (self.firstImageFrame.height/2), width: self.firstImageFrame.width, height: self.firstImageFrame.height)
//        })]
//    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        let touch = touches.first!
//        let touchLocation = touch.location(in: self.view)
//
//
//        [UIView .animate(withDuration: 0.5, animations: {
//            self.firstImageView.frame = CGRect(x: touchLocation.x - (self.firstImageFrame.width/2) , y: touchLocation.y - (self.firstImageFrame.height/2), width: self.firstImageFrame.width, height: self.firstImageFrame.height)
//        })]
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        let touch = touches.first!
//        let touchLocation = touch.location(in: self.view)
//
//        [UIView .animate(withDuration: 7, animations: {
//            self.firstImageView?.frame = CGRect(x: touchLocation.x - ((self.firstImageFrame?.width)!/2) , y: touchLocation.y - (self.firstImageFrame!.height/2), width: (self.firstImageFrame?.width)!, height: (self.firstImageFrame?.height)!)
//        })]
////        [UIView .animateKeyframes(withDuration: 7.0, delay:nil, options: UIView.AnimationOptions.curveEaseInOut, animations: {
////
////        }, completion: nil)]
//
//
//    }
    
    func initImageViews()
    {
        firstImageView.sendSubviewToBack(secondImageView)
        secondImageView.sendSubviewToBack(thirdImageView)
        
        firstImageView.layer.shadowRadius = 10
        firstImageView.layer.shadowColor = UIColor.black.cgColor
        firstImageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        firstImageView.layer.shadowOpacity = 1
        firstImageView.clipsToBounds = false
        firstImageView.isUserInteractionEnabled = true
        
        firstImageFrame = firstImageView.frame.size
        
        secondImageView.layer.shadowRadius = 10
        secondImageView.layer.shadowColor = UIColor.black.cgColor
        secondImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        secondImageView.layer.shadowOpacity = 1
        secondImageView.clipsToBounds = false
        
        thirdImageView.layer.shadowRadius = 10
        thirdImageView.layer.shadowColor = UIColor.black.cgColor
        thirdImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        thirdImageView.layer.shadowOpacity = 1
        thirdImageView.clipsToBounds = false
        
        

    }
    
    
    
}


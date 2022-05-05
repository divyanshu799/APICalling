//
//  CoreAnimationViewController.swift
//  ContinueTraining
//
//  Created by Apple User on 31/03/22.
//

import UIKit

    class CoreAnimationViewController: UIViewController{
        var myView: UIView!
        var myNewVeiw: UIView!
        var secondsRemaining = 4
        var beginPosition: CGPoint!
     
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let frame = CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize(width: 100, height: 100))
            myView = UIView(frame: frame)
            myView.backgroundColor = .red
            view.addSubview(myView)
           

              
           
        }
      
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            taskAnimation()
            clock()
            
      

            
       }
        func clock(){
            
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
          if self.secondsRemaining > 0 {
              print ("\(self.secondsRemaining) seconds")
              self.secondsRemaining -= 1
            } else {
                self.secondsRemaining = 4
                self.taskAnimation()
                self.myView.center = self.beginPosition
                print(self.myView.center)
            }
        }
        }
        
        func taskAnimation(){
        UIView.animateKeyframes(withDuration: 5,
          delay: 0,
                                options: [.calculationModeLinear, .repeat],
          animations: {
            UIView.addKeyframe(
                withRelativeStartTime: 0,
                relativeDuration: 0.20) {
                    self.myView.center = self.randomCoordinates()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.20, relativeDuration: 0.20) {
                self.myView.center = self.randomCoordinates()                }

            UIView.addKeyframe(withRelativeStartTime: 0.40, relativeDuration: 0.20) {
                self.myView.center = self.randomCoordinates()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.60, relativeDuration: 0.20) {
                self.myView.center = self.randomCoordinates()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.80, relativeDuration: 0.20) {
                self.myView.center = self.randomCoordinates()
                self.beginPosition = self.myView.center
                //print(self.beginPosition)
            }
            UIView.addKeyframe(withRelativeStartTime: 1, relativeDuration: 0) {
                self.myView.center = self.beginPosition
                self.myView.layer.speed = 1
                //print(self.beginPosition)
                
            }
        })

        }
     
        func randomCoordinates()-> CGPoint{
            let maxXValue = view.frame.width
            let maxYValue = view.frame.height
            
            var rand_x = CGFloat(arc4random_uniform(UInt32(maxXValue)))
            var rand_y = CGFloat(arc4random_uniform(UInt32(maxYValue)))
            let position = CGPoint(x: rand_x, y: rand_y)
           print(position)
            return position
        }
        
    }



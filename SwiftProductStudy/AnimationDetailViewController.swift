//
//  AnimationDetailViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/13.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class AnimationDetailViewController: UIViewController {

    var barTitle = ""
    var animateView: UIView!
    fileprivate let duration = 2.0
    fileprivate let delay = 0.2
    fileprivate let scale = 1.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRect()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = barTitle
    }
    
    fileprivate func setupRect() {
        if barTitle == "BezierCurve Position" {
            animateView = drawCircleView()
        }else if barTitle == "View Fade in" {
            animateView = UIImageView(image: UIImage(named: "whatsapp"))
            animateView.frame = generalFrame
            animateView.center = generalCenter
        }else {
            animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
        }
        view.addSubview(animateView)
    }
    
    func didTapAnimate() {
        switch barTitle {
        case "2-color":
            changeColor(UIColor.green)
        case "Simple 2D Rotation":
            rotateView(Double.pi)
        case "Multicolor":
            multiColor(UIColor.green, UIColor.blue)
        case "Multi point Position":
            multiPosition(CGPoint(x: animateView.frame.origin.x, y: 100),CGPoint(x: animateView.frame.origin.x, y: 350))
        case "BezierCurve Position":
            var controlPoint1 = self.animateView.center
            controlPoint1.y -= 125.0
            var controlPoint2 = controlPoint1
            controlPoint2.x += 40.0
            controlPoint2.y -= 125.0
            var endPoint = self.animateView.center
            endPoint.x += 75.0
        case "Color and Frame Change":
            let currentFrame = self.animateView.frame
            let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
            let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
            let thirdFrame = firstFrame.insetBy(dx: -15, dy: -20)
            colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
        case "View Fade In":
            viewFadeIn()
        default:
            let alert = makeAlert("Alert", message: "The animation not implemented", actionTitle: "OK")
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    fileprivate func changeColor(_ color: UIColor) {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animateView.backgroundColor = color
        }, completion: nil)
    }
    
    fileprivate func rotateView(_ angel: Double) {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
        })
    }
    
    fileprivate func multiColor(_ firstColor: UIColor, _ secondColor: UIColor) {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animateView.backgroundColor = firstColor
        }) { finish in
            self.changeColor(secondColor)
        }
    }
    
    fileprivate func simplePosition(_ firstPoint: CGPoint) {
        UIView.animate(withDuration: self.duration, animations: {
            self.animateView.frame.origin = firstPoint
        }, completion: nil)
    }
    
    fileprivate func multiPosition(_ firstPoint: CGPoint, _ secondPoint: CGPoint) {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animateView.frame.origin = firstPoint
        }) { finished in
            self.simplePosition(secondPoint)
        }
        
    }
    
    fileprivate func curvePath(_ endPoint: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) {
        let path = UIBezierPath()
        path.move(to: self.animateView.center)
        
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        anim.duration = self.duration
        
        self.animateView.layer.add(anim, forKey: "animate position along path")
        self.animateView.center = endPoint
        
    }
    
    fileprivate func colorFrameChange(_ firstFrame: CGRect, _ secondFrame: CGRect, _ thirdFrame: CGRect, _ firstColor: UIColor, _ secondColor: UIColor, _ thirdColor: UIColor) {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animateView.backgroundColor = firstColor
            self.animateView.frame = firstFrame
        }) { (finish) in
            UIView.animate(withDuration: self.duration, animations: { 
                self.animateView.backgroundColor = secondColor
                self.animateView.frame = secondFrame
            }, completion: { (finish) in
                UIView.animate(withDuration: self.duration, animations: { 
                    self.animateView.backgroundColor = thirdColor
                    self.animateView.frame = thirdFrame
                }, completion: { (finish) in
                    
                })
            })
        }
    }
    
    fileprivate func viewFadeIn() {
        let secondView = UIImageView(image: UIImage(named: "facebook"))
        secondView.frame = self.animateView.frame
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: self.animateView)
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            secondView.alpha = 1.0
            self.animateView.alpha = 0.0
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

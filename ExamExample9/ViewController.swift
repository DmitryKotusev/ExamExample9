//
//  ViewController.swift
//  ExamExample9
//
//  Created by Dmitry Kotusev on 6/17/18.
//  Copyright © 2018 Dmitry Kotusev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pentagon: CAShapeLayer!
    
    @IBOutlet weak var animationControl: UISegmentedControl!
    @IBOutlet weak var backgroungControl: UISegmentedControl!
    @IBAction func changed(_ sender: Any) {
        pentagon.removeAllAnimations()
        if(backgroungControl.selectedSegmentIndex == 0)
        {
            pentagon.fillColor = UIColor.blue.cgColor
        }
        else
        {
            pentagon.fillColor = UIColor(patternImage: UIImage(named: "Image")!).cgColor
        }
    }
    @IBAction func animationPressed(_ sender: Any) {
        switch animationControl.selectedSegmentIndex {
        case 0:
            pentagon.removeAllAnimations()
        case 1: do {
            //pentagon.removeAllAnimations()
            pentagon.removeAllAnimations()
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
            animation.values = [
            0, Double.pi * 6
            ]
            animation.keyTimes = [0, 1]
            animation.duration = 4
            pentagon.add(animation, forKey: nil)
            }
        case 2:
            //pentagon.removeAllAnimations()
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.values = [
            [pentagon.position.x, pentagon.position.y],
            [pentagon.position.x, pentagon.position.y + 60],
            [pentagon.position.x, pentagon.position.y]
            ]
            animation.keyTimes = [0.0, 0.5, 1.0]
            animation.duration = 6
            pentagon.add(animation, forKey: nil)
        case 3:
            //pentagon.removeAllAnimations()
            let animation = CAKeyframeAnimation(keyPath: "opacity")
            animation.values = [
            1.0, 0.0, 1.0
            ]
            animation.keyTimes = [0.0, 0.5, 1.0]
            animation.duration = 6
            pentagon.add(animation, forKey: nil)
            break
        default: do {
            pentagon.removeAllAnimations()
            }
        }
    }
    func getPentagonPath(center: CGPoint, radius: CGFloat) -> UIBezierPath {
        let pentagonPath = UIBezierPath()
        pentagonPath.move(to: CGPoint(x: center.x, y: center.y - radius))
        let centerX = Double(center.x)
        let centerY = Double(center.y)
        let n = 5
        let angleTurn = Double.pi * 2.0 / Double(n)
        for i in 1...(n - 1) {
            pentagonPath.addLine(to: CGPoint(x: centerX + cos(-Double.pi / 2.0 + angleTurn * Double(i)) * Double(radius), y: centerY + sin(-Double.pi / 2.0 + angleTurn * Double(i)) * Double(radius)))
        }
        pentagonPath.close()
        return pentagonPath
    }
    
    func drawPentagon() {
        pentagon = CAShapeLayer()
        pentagon.frame = CGRect(x: 110, y: 150, width: 200, height: 200)
        pentagon.path = getPentagonPath(center: CGPoint(x: 100, y: 100), radius: 100).cgPath
        pentagon.fillColor = UIColor.blue.cgColor
        
        self.view.layer.addSublayer(pentagon)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawPentagon()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


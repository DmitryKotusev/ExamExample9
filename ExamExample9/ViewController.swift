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
    
    @IBOutlet weak var backgroungControl: UISegmentedControl!
    @IBAction func changed(_ sender: Any) {
        if(backgroungControl.selectedSegmentIndex == 0)
        {
            pentagon.fillColor = UIColor.blue.cgColor
        }
        else
        {
            pentagon.fillColor = UIColor(patternImage: UIImage(named: "Image")!).cgColor
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
        pentagon.frame = CGRect(x: 160, y: 130, width: 200, height: 200)
        pentagon.path = getPentagonPath(center: CGPoint(x: 50, y: 50), radius: 100).cgPath
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


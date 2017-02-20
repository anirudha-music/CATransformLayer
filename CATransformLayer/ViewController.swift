//
//  ViewController.swift
//  CATransformLayer
//
//  Created by LA Argon on 20/02/17.
//  Copyright © 2017 LA Argon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // set up the perspective transform 
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        self.view.layer.sublayerTransform = pt
        
        // set up the transform cube 1 and add it.
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        
        let cube1 = self.cube(withTransform: c1t)
        self.view.layer.addSublayer(cube1)
        
        // set up the transform for cube 2 and add it
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 0, 0)
        c2t = CATransform3DRotate(c2t, -(CGFloat)(M_PI_4), 1, 0, 0)
        c2t = CATransform3DRotate(c2t, -(CGFloat)(M_PI_4), 0, 1, 0)
        let cube2 = self.cube(withTransform: c2t)
        self.view.layer.addSublayer(cube2)
    }

    func face(withTransform transform: CATransform3D) -> CALayer {
        // create cube face layer
        let face = CALayer()
        face.frame = CGRect(x: -50.0, y: -50.0, width: 100, height: 100)
        
        // apply a random color
        face.backgroundColor = getRandomColor().cgColor
        
        // apply the transform and return
        face.transform = transform
        return face
    }
    
    func cube(withTransform transform: CATransform3D) -> CALayer {
        // create a cube layer
        let cube = CATransformLayer()
        
        // add cube face 1
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(self.face(withTransform: ct))
        
        // add cube face 2
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 0, 1, 0)
        cube.addSublayer(self.face(withTransform: ct))
        
        // add cube face 3
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 1, 0, 0)
        cube.addSublayer(self.face(withTransform: ct))
        
        // add cube face 4
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 1, 0, 0)
        cube.addSublayer(self.face(withTransform: ct))
        
        // add cube face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 0, 1, 0)
        cube.addSublayer(self.face(withTransform: ct))
        
        // add cube face 6
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(M_PI), 0, 1, 0)
        cube.addSublayer(self.face(withTransform: ct))
        
        // center the cube layer within the container
        let containerSize = self.view.bounds.size
        cube.position = CGPoint(x: containerSize.width / 2.0,
                                y: containerSize.height / 2.0)
        
        // apply the transform and return 
        cube.transform = transform
        return cube
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
}


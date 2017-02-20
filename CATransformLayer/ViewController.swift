//
//  ViewController.swift
//  CATransformLayer
//
//  Created by LA Argon on 20/02/17.
//  Copyright © 2017 LA Argon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draw(Gradient: containerView)
    }
    
    func draw(Gradient view: UIView) {
        // create gradient layer and add it to the view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
        
        // set gradient layer colors
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
        
        // set the locations
        gradientLayer.locations = [0.0, 0.2, 0.5]
        
        // set the gradient start and end point
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    func draw(multipartGradient view: UIView) {
        // create gradient layer and add it to the view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
}


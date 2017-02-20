//
//  Config.swift
//  CATransformLayer
//
//  Created by LA Argon on 20/02/17.
//  Copyright © 2017 LA Argon. All rights reserved.
//

import UIKit

func getRandomColor() -> UIColor {
    //Generate between 0 to 1
    let red:CGFloat = CGFloat(drand48())
    let green:CGFloat = CGFloat(drand48())
    let blue:CGFloat = CGFloat(drand48())
    
    return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}

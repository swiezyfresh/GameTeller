
//
//  GradientConfig.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 13.02.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func configureBarGradient() -> CAGradientLayer  {
        
        let layerFrame = self.navigationBar.bounds
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
        let topColor = UIColor(hex: "098A00")
        let bottomColor = UIColor(hex: "1B5E00")
        
        let gradientColors : [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations : [Float] = [0.0, 1.0]
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = CGRect(x: layerFrame.origin.x, y: layerFrame.origin.y - statusBarHeight, width: layerFrame.size.width, height: layerFrame.size.height + statusBarHeight)

//        self.navigationBar.layer.addSublayer(gradientLayer)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.renderInContext(UIGraphicsGetCurrentContext()!)
        let bgAsImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationBar.setBackgroundImage(bgAsImage, forBarMetrics: UIBarMetrics.Default)
        
        return gradientLayer
    }
    
    
    
}

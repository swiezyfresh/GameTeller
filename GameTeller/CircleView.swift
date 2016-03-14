//
//  CircleView.swift
//  GameTeller
//
//  Created by Krystian Gontarek on 13.03.2016.
//  Copyright © 2016 DevCrew. All rights reserved.
//

import UIKit

class CircleView : UIView {
    
    // MARK: - Properties
    
    var backgroundLayer : CAShapeLayer!
    var gradientLayer : CAGradientLayer!
    var maskLayer : CAShapeLayer!
    var viewController : UIViewController!
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // MARK: - Setup Function
    
    func setup() {
        
        // Make a circle in rectangle
        
        let circleRect = CGRect(x: 5, y: 5, width: self.bounds.size.width - 10, height: self.bounds.size.height - 10)
        
        // MARK: - Layers
        
        // MARK: - Layers | backgroundLayer
        
        backgroundLayer = CAShapeLayer()
        backgroundLayer.frame = self.bounds
        backgroundLayer.lineWidth = 5.0
        backgroundLayer.strokeColor = UIColor.darkGrayColor().CGColor
        backgroundLayer.fillColor = UIColor.clearColor().CGColor
        backgroundLayer.path = UIBezierPath(ovalInRect: circleRect).CGPath
        
        // MARK: - Layers | gradientLayer
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(hex: "39C839").CGColor, UIColor(hex: "257425").CGColor]
        gradientLayer.locations = [0.0, 1.0]
        
        // MARK: - Layers | maskLayer
        
        maskLayer = CAShapeLayer()
        maskLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        maskLayer.frame = self.bounds
        maskLayer.strokeColor = UIColor.blackColor().CGColor
        maskLayer.fillColor = UIColor.clearColor().CGColor
        maskLayer.lineWidth = 5.0
        maskLayer.strokeStart = 0.0
        maskLayer.strokeEnd = 0.0
        maskLayer.path = UIBezierPath(ovalInRect: circleRect).CGPath
        maskLayer.transform = CATransform3DRotate(maskLayer.transform, CGFloat(-M_PI_2), 0.0, 0.0, 1.0)
        
        
        // Put on the mask on a gradientLayer
        
        gradientLayer.mask = maskLayer
        gradientLayer.masksToBounds = false
        
        // Adding layers to the main layer
        
        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(gradientLayer)
        
    }
    
    // MARK: - Animations
    
    func animateTo(to: CGFloat) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 5.0
        animation.toValue = to
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.delegate = viewController
        self.maskLayer.addAnimation(animation, forKey: "Animation")
        
    }
    
}

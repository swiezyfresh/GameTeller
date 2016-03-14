//
//  AnimationsExt.swift
//  OurMemories
//
//  Created by Krystian Gontarek on 12.12.2015.
//  Copyright © 2015 KreskowDev. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeIn(duration : NSTimeInterval) {
        self.alpha = 0
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 1
            }
        )
    }
    
    func fadeOut(duration : NSTimeInterval) {
        self.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            self.alpha = 0
        })
    }
    
    func slideFromLeft(duration : NSTimeInterval) {
        self.alpha = 0
        self.center.x -= self.bounds.size.width
        self.alpha = 1
        UIView.animateWithDuration(duration, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: [], animations: {
                self.center.x += self.bounds.size.width
            }, completion: nil)
    }
    
    func slideFromRight(duration : NSTimeInterval) {
        self.alpha = 0
        self.center.x += self.bounds.size.width
        self.alpha = 1
        UIView.animateWithDuration(duration, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: [], animations: {
            self.center.x -= self.bounds.size.width
            }, completion: nil)
    }
    
    func slideFromDown(duration : NSTimeInterval) {
        self.alpha = 0
        self.center.y += self.bounds.size.height
        UIView.animateWithDuration(duration, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: [], animations: {
                self.center.y -= self.bounds.size.height
                self.alpha = 1
            }, completion: nil)
    }
    
    
    
}
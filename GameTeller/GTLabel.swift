//
//  GTLabel.swift
//  SomeTests
//
//  Created by Thorsten Klusemann on 12.03.16.
//  Copyright © 2016 Karrmarr Software. All rights reserved.
//

import UIKit

@IBDesignable
class GTLabel : UILabel {
    
    @IBInspectable var topInset: CGFloat = 0.0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable var bottomInset: CGFloat = 0.0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable var leftInset: CGFloat = 0.0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    @IBInspectable var rightInset: CGFloat = 0.0 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, edgeInsets()))
    }
    
    override func intrinsicContentSize() -> CGSize {
        var parentContentSize: CGSize = super.intrinsicContentSize()
        parentContentSize.width += leftInset + rightInset
        parentContentSize.height += topInset + bottomInset
        return parentContentSize
    }
    
    func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    }
}

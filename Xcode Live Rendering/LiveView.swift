//
//  LiveView.swift
//  Xcode Live Rendering
//
//  Created by Morten Bøgh on 21/07/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

@IBDesignable
class LiveView: UIView {
    private var titleLabel = UILabel()
    private var avatarImageView = UIImageView()
    
    @IBInspectable public var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    @IBInspectable public var avatarImage: UIImage = UIImage() {
        didSet {
            let size = self.avatarImage.size
            let rect = CGRectMake(0, 0, size.width, size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
            var path = UIBezierPath(ovalInRect: rect)
            path.addClip()
            self.avatarImage.drawInRect(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            self.avatarImageView.image = image
        }
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addSubview(self.avatarImageView)
        self.avatarImageView.contentMode = .ScaleAspectFit
        self.avatarImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.avatarImageView.clipsToBounds = true
        self.addConstraint(NSLayoutConstraint(item: self.avatarImageView, attribute: .Top, relatedBy: .GreaterThanOrEqual, toItem: self, attribute: .Top, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: self.avatarImageView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: self.avatarImageView, attribute: .Trailing, multiplier: 1.0, constant: 10.0))
        
        self.addSubview(self.titleLabel)
        self.titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.titleLabel.setContentCompressionResistancePriority(self.avatarImageView.contentCompressionResistancePriorityForAxis(.Vertical) + 1, forAxis: .Vertical)
        self.titleLabel.textAlignment = .Center
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .Top, relatedBy: .Equal, toItem: self.avatarImageView, attribute: .Bottom, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: self.titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: self.titleLabel, attribute: .Trailing, multiplier: 1.0, constant: 10.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .GreaterThanOrEqual, toItem: self.titleLabel, attribute: .Bottom, multiplier: 1.0, constant: 10.0))
    }
}

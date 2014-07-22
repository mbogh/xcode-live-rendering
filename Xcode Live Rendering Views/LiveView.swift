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
            self.avatarImageView.image = avatarImage
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
    }
    
    override func prepareForInterfaceBuilder() {
    }
}

//
//  LiveXibView.swift
//  Xcode Live Rendering
//
//  Created by Morten Bøgh on 22/07/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

@IBDesignable
class LiveXibView: LiveRenderedNibView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBInspectable public var title: String = "" {
        didSet {
            self.proxyView().titleLabel.text = title
        }
    }
    
    @IBInspectable public var avatarImage: UIImage = UIImage() {
        didSet {
            let size = self.avatarImage.size
            let rect = CGRectMake(0, 0, size.width, size.height)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            var path = UIBezierPath(ovalInRect: rect)
            path.addClip()
            self.avatarImage.drawInRect(rect)
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.proxyView().avatarImageView.image = image
        }
    }
    
    override func nibName() -> String {
        return "LiveXibView"
    }
    
    private func proxyView() -> LiveXibView {
        return self.proxyView! as LiveXibView
    }
}

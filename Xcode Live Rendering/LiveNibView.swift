//
//  LiveRenderedNibView.swift
//  Xcode Live Rendering
//
//  Created by Morten Bøgh on 29/07/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

@IBDesignable
public class LiveNibView: UIView {
    public weak var proxyView: LiveNibView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        var view = self.loadNib()
        view.frame = self.bounds
        view.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        self.proxyView = view
        
        if let view = proxyView {
            self.addSubview(view)
        }
    }
    
    required public init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override public func awakeAfterUsingCoder(aDecoder: NSCoder!) -> AnyObject! {
        if self.subviews.count == 0 {
            var view = self.loadNib()
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
            let contraints = self.constraints()
            self.removeConstraints(contraints)
            view.addConstraints(contraints)
            view.proxyView = view
            return view
        }
        return self
    }

    private func loadNib() -> LiveNibView {
        let bundle = NSBundle(forClass: self.dynamicType)
        return bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)[0] as LiveNibView
    }
    
    public func nibName() -> String {
        return ""
    }
}

//
//  UIStoryboardSegueFromRight .swift
//  TipAdvisor
//
//  Created by Chris Okorodudu on 4/23/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class UIStoryboardSegueFromRight_: UIStoryboardSegue {
    override func perform()
    {
        let src = self.source as UIViewController
        let dst = self.destination as UIViewController
        
        src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
        dst.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
        
        UIView.animate(withDuration: 0.25,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    dst.view.transform = CGAffineTransformMakeTranslation(0, 0)
        },
                                   completion: { finished in
                                    src.presentViewController(dst, animated: false, completion: nil)
        }
        )
    }
}

class UIStoryboardUnwindSegueFromRight: UIStoryboardSegue {
    
    override func perform()
    {
        let src = self.sourceViewController as UIViewController
        let dst = self.destinationViewController as UIViewController
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        src.view.transform = CGAffineTransformMakeTranslation(0, 0)
        
        UIView.animateWithDuration(0.25,
                                   delay: 0.0,
                                   options: UIViewAnimationOptions.CurveEaseInOut,
                                   animations: {
                                    src.view.transform = CGAffineTransformMakeTranslation(src.view.frame.size.width, 0)
        },
                                   completion: { finished in
                                    src.dismissViewControllerAnimated(false, completion: nil)
        }
        )
    }
}

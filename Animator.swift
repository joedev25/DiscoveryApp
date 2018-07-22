//
//  Animator.swift
//  DiscoveryApp
//
//  Created by John Kulimushi on 22/07/2018.
//  Copyright © 2018 John Kulimushi. All rights reserved.
//

import UIKit


class Animator: NSObject,UIViewControllerAnimatedTransitioning {
    
    var isPresenting:Bool?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using ctx: UIViewControllerContextTransitioning) {
        let containerView = ctx.containerView
        
        //Retrieving to and from ViewController from the context
        let toViewController = ctx.viewController(forKey: .to)
        let fromViewController = ctx.viewController(forKey: .from)
        
        
        //Making sure that isPresenting field is set
        guard let isPresenting = self.isPresenting else {
            return
        }
        
        
        //Defining details and home viewController
        guard let detailsController = isPresenting ? toViewController : fromViewController as? DetailsController else { return }
        
        guard let homeController = isPresenting ? fromViewController : toViewController as? HomeController else { return }
        
        if isPresenting{
            detailsController.view.alpha = 0
        }
        
        containerView.backgroundColor = .white
        containerView.addSubview((toViewController?.view)!)
        containerView.bringSubview(toFront: detailsController.view)
        
        UIView.animate(withDuration: transitionDuration(using: ctx), animations: {
            detailsController.view.alpha = isPresenting ? 1 : 0
        }) { success in
            ctx.completeTransition(!ctx.transitionWasCancelled)
        }
        
    }

}


































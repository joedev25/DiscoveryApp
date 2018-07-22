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
    var initialFrame:CGRect?
    var finalFrame:CGRect?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using ctx: UIViewControllerContextTransitioning) {
        let containerView = ctx.containerView
        
        //Retrieving to and from ViewController from the context
        let toViewController = ctx.viewController(forKey: .to)
        let fromViewController = ctx.viewController(forKey: .from)
        
        
        //Making sure that isPresenting field is set
        guard let isPresenting = self.isPresenting,
            let initialFrame = self.initialFrame,
            let finalFrame = self.finalFrame else {
            return
        }
        
        
        //Defining details and home viewController
        guard let detailsController = isPresenting
            ? toViewController as? DetailsController
            : fromViewController  as? DetailsController else { return }
        
        guard let homeController = isPresenting
            ? fromViewController as? HomeController
            : toViewController as? HomeController else { return }
        
        if isPresenting{
            detailsController.imageView.bounds = initialFrame
            detailsController.imageView.center =  CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            detailsController.imageView.layer.cornerRadius = 10
            //TODO:-to be changed
            homeController.view.alpha =  1
            detailsController.townName.alpha = 0
            detailsController.fullDescription.alpha =  0
        }
        
        containerView.backgroundColor = .white
        containerView.addSubview((toViewController?.view)!)
        containerView.bringSubview(toFront: detailsController.view)
        
        UIView.animate(withDuration: transitionDuration(using: ctx), animations: {
            //Animatable Properties
            //https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html
            detailsController.imageView.bounds = isPresenting ? finalFrame : initialFrame
            
            detailsController.imageView.center = isPresenting ? CGPoint(x: finalFrame.midX, y: finalFrame.midY) : CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            
            detailsController.imageView.layer.cornerRadius = isPresenting ? 0 : 10
            //TODO:-to be changed
            homeController.view.alpha = isPresenting ? 0 : 1
            detailsController.townName.alpha = isPresenting ? 1 : 0
            detailsController.fullDescription.alpha = isPresenting ? 1 : 0

            
        }) { success in
            ctx.completeTransition(!ctx.transitionWasCancelled)
        }
        
    }

}


































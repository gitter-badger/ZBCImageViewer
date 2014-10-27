//
//  ZBCImageTransition.m
//  ZBCImageViewer
//
//  Created by Andre Cytryn on 10/25/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "ZBCImageTransition.h"

#import "ZBCCollectionViewController.h"
#import "ZBCDestinationViewController.h"



@implementation ZBCImageTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    ZBCCollectionViewController *fromViewController = (ZBCCollectionViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    ZBCDestinationViewController *toViewController = (ZBCDestinationViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Generating snapshot of origin view
    UIView *viewSnapshot = [self.originView snapshotViewAfterScreenUpdates:NO];
    viewSnapshot.frame = [containerView convertRect:self.originView.frame fromView:self.originView.superview];
    self.originView.hidden = YES;
    
    // Setting initial settings
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    self.destinationView.hidden = YES;
    
    // Adding to container view
    [containerView addSubview:toViewController.view];
    [containerView addSubview:viewSnapshot];
    
    // Setting destination image equal to origin, maybe its better to let the user do that on segue?
    UIImageView *imageView = (UIImageView *)self.originView;
    [toViewController.zombieImageView setImage:imageView.image];
    
    
    [UIView animateWithDuration:duration animations:^{
        // Fade in the destination view controller's view
        toViewController.view.alpha = 1.0;

        // Move the snapshot over destination view
        CGRect frame = [containerView convertRect:self.destinationView.frame fromView:toViewController.view];
        viewSnapshot.frame = frame;

    } completion:^(BOOL finished) {
        
        // Moving back to original state
        self.originView.hidden = NO;
        self.destinationView.hidden = NO;
        [viewSnapshot removeFromSuperview];
        
        // Animation finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];


}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}


@end

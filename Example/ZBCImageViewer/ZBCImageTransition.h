//
//  ZBCImageTransition.h
//  ZBCImageViewer
//
//  Created by Andre Cytryn on 10/25/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBCImageTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImageView *originView;

@property (nonatomic, strong) UIImageView *destinationView;

@end

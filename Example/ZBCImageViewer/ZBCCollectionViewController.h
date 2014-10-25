//
//  ZBCCollectionViewController.h
//  ZBCImageViewer
//
//  Created by Gustavo Barbosa on 10/25/14.
//  Copyright (c) 2014 Zombie Coding. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBCCollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

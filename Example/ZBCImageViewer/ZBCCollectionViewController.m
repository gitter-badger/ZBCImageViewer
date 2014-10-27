//
//  ZBCCollectionViewController.m
//  ZBCImageViewer
//
//  Created by Gustavo Barbosa on 10/25/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "ZBCCollectionViewController.h"

#import "ZBCZombieCollectionViewCell.h"
#import "ZBCDestinationViewController.h"
#import "ZBCImageTransition.h"


@interface ZBCCollectionViewController () <UINavigationControllerDelegate>

@end

@implementation ZBCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}


#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZBCZombieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZombieCell" forIndexPath:indexPath];
    
    [cell.zombieImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"zombie%li", indexPath.row % 5]]];
    
    return cell;
}


#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if the transition id form this view controller to destination view controller
    if (fromVC == self && [toVC isKindOfClass:[ZBCDestinationViewController class]]) {
        ZBCZombieCollectionViewCell *cell = (ZBCZombieCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:[[self.collectionView indexPathsForSelectedItems] firstObject]];
        ZBCDestinationViewController *destinationVC = (ZBCDestinationViewController *)toVC;
        ZBCImageTransition *protocol = [[ZBCImageTransition alloc] init];
        protocol.originView = cell.zombieImageView;
        protocol.destinationView = destinationVC.zombieImageView;
        
        return protocol;
    }
    else {
        return nil;
    }
}

#pragma mark - Memory


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

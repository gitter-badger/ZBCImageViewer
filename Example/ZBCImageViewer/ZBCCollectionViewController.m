//
//  ZBCCollectionViewController.m
//  ZBCImageViewer
//
//  Created by Gustavo Barbosa on 10/25/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "ZBCCollectionViewController.h"
#import "ZBCZombieCollectionViewCell.h"

@interface ZBCCollectionViewController ()

@end

@implementation ZBCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

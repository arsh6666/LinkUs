//
//  ImageTableViewCell.m
//  LinkUs
//
//  Created by Arshdeep Singh on 24/09/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageCollectionView.delegate = self;
    self.imageCollectionView.dataSource = self;
    // Initialization code
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), (self.contentView.frame.size.height));
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ImageArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    JobImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellImages" forIndexPath:indexPath];
    cell.imgJob.image = [self.ImageArray objectAtIndex:indexPath.row];
    
//    NSString *strImage = [self.arraySlider[indexPath.row]valueForKey:@"image"];
//
//    NSString *imageName = [strImage stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ;
//
//    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.fastchef.in/protected/uploads/%@",imageName]];
//    cell.imgBackGround.imageURL = imageURL;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"homeAdsSlider" object:nil userInfo:self.arraySlider[indexPath.row]];
    //  homeAdsSlider
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

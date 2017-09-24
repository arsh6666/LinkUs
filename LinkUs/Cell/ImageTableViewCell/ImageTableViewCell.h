//
//  ImageTableViewCell.h
//  LinkUs
//
//  Created by Arshdeep Singh on 24/09/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (strong, nonatomic) IBOutlet UIButton *btnAdd;

@end

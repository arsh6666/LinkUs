//
//  JobsListTableViewCell.h
//  LinkUs
//
//  Created by Arshdeep Singh on 29/09/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobsListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgJob;
@property (strong, nonatomic) IBOutlet UILabel *lblJobTittle;
@property (strong, nonatomic) IBOutlet UILabel *lblDisc;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet UILabel *lblOffer;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;

@end

//
//  ProfilesTableViewCell.h
//  LinkUs
//
//  Created by Arshdeep Singh on 30/09/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfilesTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet AsyncImageView *imgUser;
@property (strong, nonatomic) IBOutlet UILabel *lblDiscription;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblPlace;
@property (strong, nonatomic) IBOutlet UILabel *lblRate;

@end

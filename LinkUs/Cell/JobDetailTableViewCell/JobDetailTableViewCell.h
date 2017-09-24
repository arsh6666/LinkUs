//
//  JobDetailTableViewCell.h
//  LinkUs
//
//  Created by Arshdeep Singh on 24/09/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtTittle;
@property (strong, nonatomic) IBOutlet UITextField *txtDiscription;
@property (strong, nonatomic) IBOutlet UITextField *txtBudget;
@property (strong, nonatomic) IBOutlet UIButton *btnFixed;
@property (strong, nonatomic) IBOutlet UIButton *btnHourly;
@property (strong, nonatomic) IBOutlet UIButton *btnPost;

@end

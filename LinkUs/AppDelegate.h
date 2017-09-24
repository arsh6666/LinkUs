//
//  AppDelegate.h
//  LinkUs
//
//  Created by Arshdeep Singh on 17/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
    @property (nonatomic, readwrite) NSDictionary *userProfile;
    @property (nonatomic, readwrite) NSString *userID;
AppDelegate *appDelegate(void);

@end


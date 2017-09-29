//
//  AppDelegate.m
//  LinkUs
//
//  Created by Arshdeep Singh on 17/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-60, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    UIViewController *VC;
    
   
    bool logged = [[NSUserDefaults standardUserDefaults]boolForKey:@"LoggedUser"];
    
    if(logged == YES)
    {
        VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tabViewController"];
        self.userID = [[NSUserDefaults standardUserDefaults]valueForKey:@"UserID"];
        self.userProfile = [[NSUserDefaults standardUserDefaults]valueForKey:@"UserProfile"];
        
    }
    else{
        VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"nav"];
        
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = VC;
    [self.window makeKeyAndVisible];
    
   // [UINavigationBar appearance].barTintColor = [UIColor yellowColor];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



AppDelegate *appDelegate (void)
{
    return [[UIApplication sharedApplication]delegate];
}

@end

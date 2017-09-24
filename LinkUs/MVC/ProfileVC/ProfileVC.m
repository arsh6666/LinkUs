//
//  ProfileVC.m
//  LinkUs
//
//  Created by Arshdeep Singh on 20/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "ProfileVC.h"

@interface ProfileVC ()
@property (strong, nonatomic) IBOutlet UITableView *tblProfile;
    @property (strong, nonatomic) IBOutlet UIButton *btnLogout;
- (IBAction)btnLogout:(id)sender;

@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
    
}

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

- (IBAction)btnLogout:(id)sender {
     [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"LoggedUser"];
    ViewController *login = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:login];
    nav.navigationBarHidden = YES;
    [self presentViewController:nav animated:YES completion:nil];
}
@end

//
//  ASSignUpVC.m
//  assist
//
//  Created by Arshdeep Singh on 19/11/16.
//  Copyright © 2016 Rootfly Infotech. All rights reserved.
//

#import "ASSignUpVC.h"

@interface ASSignUpVC ()

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
    @property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;
    @property (strong, nonatomic) IBOutlet UIButton *btnAgree;

- (IBAction)didTapNext:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnLogin:(id)sender;
- (IBAction)btnAgree:(id)sender;

@end

@implementation ASSignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapNext:(id)sender
{
    if ([self.txtName.text length]== 0) {
        
        [Utils okAlert:@"Message" message:@"Please Enter Your Name"];
    }
    else if ([self.txtEmail.text length]==0){
        [Utils okAlert:@"Message" message:@"Please Enter Email ID"];
    }
    else if (![Utils isValidEmail:self.txtEmail.text]){
    
        [Utils okAlert:@"Message" message:@"Please enter valid Email ID"];
    }
    else if ([self.txtPassword.text length]==0){
    
        [Utils okAlert:@"Message" message:@"Please enter Password"];
    }
    else if (![self.txtPassword.text isEqualToString:self.txtConfirmPassword.text ]){
        [Utils okAlert:@"Message" message:@"Confirm password does not match please check and try again"];
    }
    else if ([self.txtPhoneNumber.text length]==0){
        
        [Utils okAlert:@"Message" message:@"Please enter Phone number"];
    }
    else if (self.btnAgree.selected == NO){
        [Utils okAlert:@"Message" message:@"Please agree terms and privacy policy"];
    }
    else
    {
    
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
        NSDictionary *parmDict = @{
                                   @"Email": self.txtEmail.text,
                                   @"PhoneNumber": self.txtPhoneNumber.text,
                                   @"Password": self.txtPassword.text,
                                   @"FirstName": self.txtName.text,
                                   @"last_name": @""
                           };
    
    [manager POST:Register parameters:parmDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if ([responseObject valueForKey:K_Result] == [NSNumber numberWithBool:false])
        {
            [Utils okAlert:@"Message" message:[responseObject valueForKey:@"ErrorList"][0]];
        }
        else{
        appDelegate().userID = [responseObject valueForKey:@"UserId"];
        
    
        NSDictionary *dictWithoutNull = [Utils dictionaryByReplacingNullsWithStrings:[responseObject valueForKey:@"UserProfile"]];
        [[NSUserDefaults standardUserDefaults]setObject:dictWithoutNull forKey:@"UserProfile"];
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"LoggedUser"];
        
        [self performSegueWithIdentifier:@"TabView" sender:sender];
        NSLog(@"success!");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
         
         [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"LoggedUser"];
         NSLog(@"%ld",(long)[response statusCode]);
         NSData *dict2 = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
         NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:dict2 options:0 error:NULL];
         
         
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         [Utils okAlert:@"OOPS" message:[[[responseDict valueForKey:@"description"]objectAtIndex:0]valueForKey:@"message"]];
         NSLog(@"error: %@", error);
    }];

    }

}

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)btnLogin:(id)sender {
    ASLoginVC *login = [self.storyboard instantiateViewControllerWithIdentifier:@"ASLoginVC"];
    [self.navigationController pushViewController:login animated:YES];
    
}
    
- (IBAction)btnAgree:(UIButton *)sender {
    
    if (sender.selected == YES) {
        sender.selected = NO;
    }
    else{
        sender.selected = YES;
    }
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

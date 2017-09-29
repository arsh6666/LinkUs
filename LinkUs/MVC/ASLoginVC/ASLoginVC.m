//
//  ASLoginVC.m
//  assist
//
//  Created by Arshdeep Singh on 19/11/16.
//  Copyright © 2016 Rootfly Infotech. All rights reserved.
//

#import "ASLoginVC.h"


@interface ASLoginVC ()


@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnForgetPassword:(id)sender;
- (IBAction)didTapNext:(id)sender;
- (IBAction)btnSignUp:(id)sender;
- (IBAction)btnBack:(id)sender;

@end

@implementation ASLoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];

   
  //  self.txtEmail.text = @"jrivera294@gmail.com";
  //  self.txtPassword.text = @"123456";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didTapNext:(id)sender
{
    if ([self.txtEmail.text length]== 0) {
        
        [Utils okAlert:@"Message" message:@"Please enter email Id"];
        
    }
    else if ([self.txtPassword.text length]== 0){
        
        [Utils okAlert:@"Message" message:@"Please enter password"];
        
    }
    else
    {
       
    [self LoginMethod:self.txtEmail.text Password:self.txtPassword.text sender:sender];
    }
}

- (IBAction)btnSignUp:(id)sender {
    
    ASSignUpVC *signUp = [self.storyboard instantiateViewControllerWithIdentifier:@"ASSignUpVC"];
    [self.navigationController pushViewController:signUp animated:YES];
    
}

- (IBAction)btnBack:(id)sender {
    
     [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}


-(void)LoginMethod : (NSString *)EmailID Password:(NSString *)password sender:(id)sender{
    
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSDictionary *paramDict = @{
                                @"email":EmailID,
                                @"password":password,
                                };
    
    
    [manager POST:Login parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if ([responseObject valueForKey:K_Result] == [NSNumber numberWithBool:false]) {
            [Utils okAlert:@"Message" message:[responseObject valueForKey:@"ErrorList"][0]];
        }
        else
        {
            NSDictionary *dictWithoutNull = [Utils dictionaryByReplacingNullsWithStrings:[responseObject valueForKey:@"UserProfile"]];
        
            [[NSUserDefaults standardUserDefaults]setObject:dictWithoutNull forKey:@"UserProfile"];
        
            appDelegate().userProfile = dictWithoutNull;
            appDelegate().userID = [responseObject valueForKey:@"UserId"];
            [[NSUserDefaults standardUserDefaults]setObject:appDelegate().userID forKey:@"UserID"];
            
            [self performSegueWithIdentifier:@"TabView" sender:sender];
        
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"LoggedUser"];
        
        NSLog(@"success!");
        }
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
         
         NSLog(@"%ld",(long)[response statusCode]);
         NSData *dict2 = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
         NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:dict2 options:0 error:NULL];
         
         [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"LoggedUser"];
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         [Utils okAlert:@"OOPS" message:[responseDict valueForKey:@"message"]];
         NSLog(@"error: %@", error);
         
     }];



}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnForgetPassword:(id)sender {
    
    ForgetPasswordVC *pfv = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordVC"];
    [self.navigationController pushViewController:pfv animated:YES];
    

}
@end

//
//  ForgetPasswordVC.m
//  LinkUs
//
//  Created by Arshdeep Singh on 19/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "ForgetPasswordVC.h"

@interface ForgetPasswordVC ()
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)btnSignIn:(id)sender;
- (IBAction)btnSend:(id)sender;
- (IBAction)btnBack:(id)sender;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)btnSignIn:(id)sender {
    
    ASSignUpVC *signUp = [self.storyboard instantiateViewControllerWithIdentifier:@"ASSignUpVC"];
    [self.navigationController pushViewController:signUp animated:YES];
}

- (IBAction)btnSend:(id)sender {
    
    //    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //
    //    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //
    //    NSDictionary *paramDict = @{
    //                                @"email":self.txtEmail.text,
    //                                };
    //
    //
    //    [manager POST:forgetPassword parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //
    //        [MBProgressHUD hideHUDForView:self.view animated:YES];
    //        [Utils okAlert:@"Message" message:[responseObject valueForKey:@"message"]];
    //        NSLog(@"success!");
    //
    //    }
    //    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    //     {
    //         NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    //
    //         NSLog(@"%ld",(long)[response statusCode]);
    //         NSData *dict2 = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
    //         NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:dict2 options:0 error:NULL];
    //
    //
    //         [MBProgressHUD hideHUDForView:self.view animated:YES];
    //         [Utils okAlert:@"OOPS" message:[responseDict valueForKey:@"message"]];
    //         NSLog(@"error: %@", error);
    //         
    //     }];

    
}

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

//
//  ServiceProviderVC.m
//  LinkUs
//
//  Created by Arshdeep Singh on 21/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "ServiceProviderVC.h"

@interface ServiceProviderVC (){
    NSMutableArray *providerArray;
}
- (IBAction)btnBack:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblProvider;

@end

@implementation ServiceProviderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSLog(@"%@",appDelegate().userID);
    
    NSDictionary *parmDict = @{

                               @"CategoryId": [NSNumber numberWithInteger:self.CatId],
                               
                               };
    
    [manager POST:GetProviders parameters:parmDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if ([responseObject valueForKey:K_Result] == [NSNumber numberWithBool:true])
        {
            providerArray = [responseObject valueForKey:@"Users"];
            [self.tblProvider reloadData];
            NSLog(@"success!");
        }
        else
        {
            
            
        }
        
    }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
         
         [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"LoggedUser"];
         NSLog(@"%ld",(long)[response statusCode]);
         NSData *dict2 = [error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"];
         NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:dict2 options:0 error:NULL];
         NSString *string = [[NSString alloc] initWithData:dict2 encoding:NSUTF8StringEncoding];
         
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         [Utils okAlert:@"OOPS" message:[[[responseDict valueForKey:@"description"]objectAtIndex:0]valueForKey:@"message"]];
         NSLog(@"error: %@", error);
     }];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return providerArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProfilesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.lblName.text = [[providerArray valueForKey:@"FirstName"]objectAtIndex:indexPath.row];
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

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end

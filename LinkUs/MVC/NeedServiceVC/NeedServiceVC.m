//
//  NeedServiceVC.m
//  LinkUs
//
//  Created by Arshdeep Singh on 21/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "NeedServiceVC.h"

@interface NeedServiceVC ()<UIImagePickerControllerDelegate,CLImageEditorDelegate,UINavigationControllerDelegate>{
    NSMutableArray *ImageArray;
    NSInteger BudgetID;
}

@property (strong, nonatomic) IBOutlet UITableView *tblService;
@property (strong, nonatomic) IBOutlet UILabel *lblPhotos;

- (IBAction)btnBack:(id)sender;

@end

@implementation NeedServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    BudgetID = 2;
    ImageArray = [NSMutableArray new];
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 160;
    }
    else{
        return 368;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
        cell.ImageArray = ImageArray;
        [cell.imageCollectionView reloadData];
        [cell.btnAdd addTarget:self action:@selector(ADDImage:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    else
    {
        JobDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jobCell"];
        [cell.btnPost addTarget:self action:@selector(ButtonPost:) forControlEvents:UIControlEventTouchUpInside];
        cell.btnFixed.selected = YES;
        [cell.btnFixed addTarget:self action:@selector(ButtonFixed:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btnHourly addTarget:self action:@selector(ButtonHourly:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
}

#pragma mark- UIImageController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //You can retrieve the actual UIImage
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:image];
    editor.delegate = self;
    
    [picker pushViewController:editor animated:YES];
    
}

#pragma mark- CLImageEditor delegate

- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image
{
   
    [ImageArray addObject:image];
    self.lblPhotos.text = [NSString stringWithFormat:@"%ld Photos",ImageArray.count];
    NSArray *indexPathArray = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    //You can add one or more indexPath in this array...
    
    [self.tblService reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
    
    [editor dismissViewControllerAnimated:YES completion:nil];
    
    
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
- (IBAction)ButtonPost:(id)sender
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    JobDetailTableViewCell *cell = [self.tblService cellForRowAtIndexPath:indexPath];
    
    
    NSMutableArray *tempArray = [NSMutableArray new];
    
    for (int i = 0; i<ImageArray.count; i++) {
        
        UIImage *image = [ImageArray objectAtIndex:i];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.4);
        NSString *imageString = [imageData base64Encoding];
        
        NSDictionary *dict = @{
                                @"Title": [NSString stringWithFormat:@"%d",i],
                                @"ImageData":imageString
                                };
        [tempArray addObject:dict];
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    float amount = [cell.txtBudget.text floatValue];
    
    NSLog(@"%@",appDelegate().userID);
    
    NSDictionary *parmDict = @{
                               @"Name": cell.txtTittle.text,
                               @"Description": cell.txtDiscription.text,
                               @"Images": tempArray,
                               @"UserId": appDelegate().userID,
                               @"BudgetId": [NSNumber numberWithInteger:BudgetID],
                               @"CategoryId": [NSNumber numberWithInteger:self.CatId],
                               @"Amount": [NSNumber numberWithFloat:amount],
                               @"Address": @"111",
                               @"LocationName":@"sample string 8",
                               @"Longitude": @"sample string 9",
                               @"Latitude":@"sample string 10"
                               };
    
    [manager POST:Create parameters:parmDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        if ([responseObject valueForKey:K_Result] == [NSNumber numberWithBool:false])
        {
            [Utils okAlert:@"Message" message:[responseObject valueForKey:@"ErrorList"][0]];
        }
        else
        {
             [self.navigationController popViewControllerAnimated:YES];
            [Utils okAlert:@"Message" message:@"Job Posted Sucessfully"];
           
            
            NSLog(@"success!");
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

}

- (IBAction)ButtonFixed:(id)sender
{
    BudgetID = 2;
    //2
}

- (IBAction)ButtonHourly:(id)sender
{
    BudgetID = 1;
    //1
}

- (IBAction)ADDImage:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end

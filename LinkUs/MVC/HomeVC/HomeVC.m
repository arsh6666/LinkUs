//
//  HomeVC.m
//  LinkUs
//
//  Created by Arshdeep Singh on 19/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()


@property (strong, nonatomic) IBOutlet UIButton *btnService;
@property (strong, nonatomic) IBOutlet UIButton *btnJobs;
@property (strong, nonatomic) IBOutlet UIButton *btnNeedService;

- (IBAction)btnNeedService:(id)sender;
- (IBAction)btnJobs:(id)sender;
- (IBAction)btnProvider:(id)sender;
- (IBAction)btnPlumbing:(id)sender;
- (IBAction)btnPestControl:(id)sender;
- (IBAction)btnLandscaping:(id)sender;
- (IBAction)btnPainting:(id)sender;
- (IBAction)btnCleaning:(id)sender;
- (IBAction)btnElectrical:(id)sender;
- (IBAction)btnHandiman:(id)sender;
- (IBAction)btnHVAC:(id)sender;
- (IBAction)btnMISC:(id)sender;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnNeedService.selected = YES;
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

-(void)categoryDefineMethod:(NSInteger)catID {
    
    if (self.btnNeedService.selected == YES)
    {
        NeedServiceVC *nvc = [self.storyboard instantiateViewControllerWithIdentifier:@"NeedServiceVC"];
        [self.navigationController pushViewController:nvc animated:YES];
        
    }
    else if (self.btnService.selected == YES){
        ServiceProviderVC *svc = [self.storyboard instantiateViewControllerWithIdentifier:@"ServiceProviderVC"];
        [self.navigationController pushViewController:svc animated:YES];
    }
    else{
        JobsListVC *jvc = [self.storyboard instantiateViewControllerWithIdentifier:@"JobsListVC"];
        [self.navigationController pushViewController:jvc animated:YES];
    }
}


#pragma mark -Define Action

- (IBAction)btnNeedService:(UIButton *)sender {
    
    if (sender.selected == NO) {
        
        self.btnNeedService.selected = YES;
        self.btnJobs.selected = NO;
        self.btnService.selected = NO;
        
    }
    
    
}

- (IBAction)btnJobs:(UIButton *)sender {
    
    if (sender.selected == NO) {
        
        self.btnNeedService.selected = NO;
        self.btnJobs.selected = YES;
        self.btnService.selected = NO;
        
    }
    
}

- (IBAction)btnProvider:(UIButton *)sender {
    
    if (sender.selected == NO) {
        
        self.btnNeedService.selected = NO;
        self.btnJobs.selected = NO;
        self.btnService.selected = YES;
        
    }

    
}

- (IBAction)btnPlumbing:(id)sender {
    [self categoryDefineMethod:0];
}

- (IBAction)btnPestControl:(id)sender {
}

- (IBAction)btnLandscaping:(id)sender {
}

- (IBAction)btnPainting:(id)sender {
}

- (IBAction)btnCleaning:(id)sender {
}

- (IBAction)btnElectrical:(id)sender {
}

- (IBAction)btnHandiman:(id)sender {
    
}
- (IBAction)btnHVAC:(id)sender {
}

- (IBAction)btnMISC:(id)sender {
}

@end

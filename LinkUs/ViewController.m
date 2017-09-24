//
//  ViewController.m
//  LinkUs
//
//  Created by Arshdeep Singh on 17/08/17.
//  Copyright © 2017 Arshdeep Singh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)btnLogin:(id)sender;
- (IBAction)btnFacebook:(id)sender;
- (IBAction)btnGoogle:(id)sender;
- (IBAction)btnSignup:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLogin:(id)sender {
    
    ASLoginVC *login = [self.storyboard instantiateViewControllerWithIdentifier:@"ASLoginVC"];
    [self.navigationController pushViewController:login animated:YES];
    
}

- (IBAction)btnFacebook:(id)sender {
    
}

- (IBAction)btnGoogle:(id)sender {
}

- (IBAction)btnSignup:(id)sender {
    
    ASSignUpVC *signUp = [self.storyboard instantiateViewControllerWithIdentifier:@"ASSignUpVC"];
    [self.navigationController pushViewController:signUp animated:YES];
    
}

@end

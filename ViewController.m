//
//  ViewController.m
//  SocialSignUp
//
//  Created by jayaprada on 12/07/16.
//  Copyright © 2016 jayaprada. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(weak,nonatomic)IBOutlet UIButton *fbLoginButton;
- (IBAction)fbLoginBtnTapped:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    self.fbLoginButton.readPermissions = @[@"email",@"public_profile",@"user_friends"];
    
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fbLoginBtnTapped:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
    
  
}
@end

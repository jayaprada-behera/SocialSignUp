//
//  ViewController.m
//  SocialSignUp
//
//  Created by jayaprada on 12/07/16.
//  Copyright © 2016 jayaprada. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<GIDSignInUIDelegate>
@property(weak,nonatomic)IBOutlet UIButton *fbLoginButton;
- (IBAction)fbLoginBtnTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *googleSignIn;
- (IBAction)googleSignInBtnTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *googleSignOut;
- (IBAction)googleSignOutBtnTapped:(id)sender;
@property(nonatomic,weak)IBOutlet UILabel *statusText;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(receiveToggleAuthUINotification:)
     name:@"ToggleAuthUINotification"
     object:nil];
    
    [self toggleAuthUI];
    [self statusText].text = @"Google Sign in\niOS Demo";

    
    
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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.isFBLogin = YES;
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
             appDelegate.isFBLogin = NO;
         } else {
             NSLog(@"Logged in");
         }
     }];
    
  
}
- (IBAction)googleSignInBtnTapped:(id)sender {
    [[GIDSignIn sharedInstance] signIn];
    [self toggleAuthUI];
}
- (IBAction)googleSignOutBtnTapped:(id)sender {
    [[GIDSignIn sharedInstance] signOut];
    // [START_EXCLUDE silent]
    [self toggleAuthUI];
    // [END_EXCLUDE]
}


// [END signout_tapped]

// Note: Disconnect revokes access to user data and should only be called in
//     scenarios such as when the user deletes their account. More information
//     on revocation can be found here: https://goo.gl/Gx7oEG.
// [START disconnect_tapped]
- (IBAction)didTapDisconnect:(id)sender {
    [[GIDSignIn sharedInstance] disconnect];
}
// [END disconnect_tapped]

// [START toggle_auth]
- (void)toggleAuthUI {
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
        // Not signed in
        [self statusText].text = @"Google Sign in\niOS Demo";
        self.googleSignIn.hidden = NO;
        self.googleSignOut.hidden = YES;
     } else {
        // Signed in
        self.googleSignIn.hidden = YES;
        self.googleSignOut.hidden = NO;
        
    }
}
// [END toggle_auth]

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    NSLog(@"Customer details: %@ %@ %@ %@", userId, idToken, name, email);
    // ...
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:@"ToggleAuthUINotification"
     object:nil];
    
}

- (void) receiveToggleAuthUINotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"ToggleAuthUINotification"]) {
        [self toggleAuthUI];
        self.statusText.text = [notification userInfo][@"statusText"];
    }
}
@end

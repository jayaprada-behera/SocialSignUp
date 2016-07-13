//
//  AppDelegate.h
//  SocialSignUp
//
//  Created by jayaprada on 12/07/16.
//  Copyright © 2016 jayaprada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property(assign,nonatomic)BOOL isFBLogin;
@end



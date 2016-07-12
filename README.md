# FB Login integration to iOS App
 First get a permission for development by clicking as developer.then do useful settings in Facebook 

select environment like iOS,download SDK and import FBCoreKit,shareKit and Loging kit to Xcode . 
write your bundle identifier in that page of FB.

Xcode settings,It will give some keys and values to paste in info.plist.

import FBCoreKit in Appdelegate 

in ApplicationDidBecomeActive     [FBSDKAppEvents activateApp];

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 

    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];



application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];



Then come to ViewController .Fb has its own FBLoginButton .
Or else we can create our custom button for FBLogin and If you are interested you can give permission like "email",@"public_profile",@"user_friends".



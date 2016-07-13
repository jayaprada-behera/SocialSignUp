# FB && Google Login integration to iOS App

# FB

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

#Google
 Install cocoa pod for Google sign in.
 Insert one more row for URLTypes in Info.plist .In URLScheme we have to mention key got from google and BundleID
 Its very simple to use .everything is availabe in google developer guide.
 GIDSignIn is used for signIn ,Signout and Disconnect
 
   [[GIDSignIn sharedInstance] signIn] is used for google sign in



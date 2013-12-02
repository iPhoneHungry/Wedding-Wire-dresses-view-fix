//
//  AppDelegate.m
//  weddingwire2
//
//  Created by iPhoneHungry@yahoo.com on 11/27/13.
//  Copyright (c) 2013 rezand. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize iosVersionNot7 = _iVarIOSversion;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //checks app version so subclassed UIWebView can fix the glitch in ios < 7
    [self checkIOSVersion];
    
    //Cookie that sets to much info but most importantly brings up app style page
    [self setAppCookie];
    
    return YES;
}

-(void)checkIOSVersion{
        
        //below checks to see if we are on a ios below 7 to fix glitches in legacy versions
        NSString *version = [[UIDevice currentDevice] systemVersion];
        _iVarIOSversion = [version floatValue] < 7.0;
    
        NSLog(@"ios Version is %@",version);
   
}

-(void)setAppCookie{
    
    //setting cookie info that could use some clean but but gets the job done
    
    NSURL * openingURL = [NSURL URLWithString:@"http://m.weddingwire.com"];
    
    NSHTTPCookie *cook = [NSHTTPCookie cookieWithProperties:
                          [NSDictionary dictionaryWithObjectsAndKeys:
                           [openingURL host], NSHTTPCookieDomain,
                           [openingURL path], NSHTTPCookiePath,
                           @"_mobile_bride_session",  NSHTTPCookieName,
                           @"_mobile_bride_session=60fe62f78b7182da198304c1df83fbaa; NREUM=h=1385702203677&r=113173&p=52577; app_signed_in=yes; is_app=true; is_iphone=true; __utma=78733387.777840936.1385582537.1385684821.1385685977.5; __utmb=78733387.17.9.1385702203953; __utmc=78733387; __utmv=78733387.|1=UserType=wedding_c29d4ac5fd969e20=1; __utmz=78733387.1385582537.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _gaos=.gaos_r=(direct).gaos_k=.pc=2.mc=(no)|(no)|(no); _gaost=.rk=; _nrlsk=nrlsk_c=1.et=1385685978; s_cc=true; s_sq=%5B%5BB%5D%5D; optimizelyBuckets=%7B%7D; optimizelySegments=%7B%22172932626%22%3A%22true%22%2C%22172930750%22%3A%22safari%22%2C%22172896518%22%3A%22direct%22%7D; rsi_segs=K10051|K10166|K10168|K0; __utmmobile=0x67154abcf8ced25e; __qca=P0-1529071490-1385583383234; optimizelyEndUserId=oeu1385583379899r0.6879155042115599; __gads=ID=21d597708222ae89:T=1385582632:S=ALNI_MYnqJcUPOGq91cGheeSijeVNEvzkQ", NSHTTPCookieValue,
                           nil]];
    
    // setting the mobile app cookie
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cook];
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

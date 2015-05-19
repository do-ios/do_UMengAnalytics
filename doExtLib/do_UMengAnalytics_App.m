//
//  do_UMengAnalytics_App.m
//  DoExt_SM
//
//  Created by 刘吟 on 15/4/9.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_UMengAnalytics_App.h"
#import "doServiceContainer.h"
#import "doIModuleExtManage.h"
#import "MobClick.h"

@implementation do_UMengAnalytics_App
@synthesize ThridPartyID;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString* appkey = [[doServiceContainer Instance].ModuleExtManage GetThirdAppKey:@"do_UMengAnalytics.plist" : @"IOSAppKey"];
    NSString* channel = [[doServiceContainer Instance].ModuleExtManage GetThirdAppKey:@"do_UMengAnalytics.plist" : @"IOSChannel"];
    [MobClick startWithAppkey:appkey reportPolicy:BATCH   channelId: channel];
    [MobClick updateOnlineConfig];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation fromThridParty:(NSString*)_id
{
    return NO;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url fromThridParty:(NSString*)_id
{
    return NO;
}
@end

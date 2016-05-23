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
#import <UMMobClick/MobClick.h>


static do_UMengAnalytics_App* instance;
@implementation do_UMengAnalytics_App
@synthesize OpenURLScheme;
+(id) Instance
{
    if(instance==nil)
        instance = [[do_UMengAnalytics_App alloc]init];
    return instance;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString* appkey = [[doServiceContainer Instance].ModuleExtManage GetThirdAppKey:@"do_UMengAnalytics.plist" : @"IOSAppKey"];
    NSString* channel = [[doServiceContainer Instance].ModuleExtManage GetThirdAppKey:@"do_UMengAnalytics.plist" : @"IOSChannel"];
    UMAnalyticsConfig *config = [UMAnalyticsConfig sharedInstance];
    
    config.appKey = appkey;
    config.channelId = channel;
    config.ePolicy = BATCH;
    [MobClick startWithConfigure:config];
    return YES;
}
@end

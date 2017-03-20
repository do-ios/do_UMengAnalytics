//
//  do_UMengAnalytics_SM.m
//  DoExt_SM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "do_UMengAnalytics_SM.h"

#import "doScriptEngineHelper.h"
#import "doIScriptEngine.h"
#import "doInvokeResult.h"
//#import <UMMobClick/MobClick.h>
#import "MobClick.h"
#import "doJsonHelper.h"

@implementation do_UMengAnalytics_SM
#pragma mark -
#pragma mark - 同步异步方法的实现

//同步
- (void)beginPageLog:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    NSString * pageName = [doJsonHelper GetOneText: _dictParas :@"pageName" :@""];
    [MobClick beginLogPageView:pageName];
    //自己的代码实现
}
- (void)endPageLog:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    NSString * pageName = [doJsonHelper GetOneText: _dictParas :@"pageName" :@""];
    [MobClick endLogPageView:pageName];
}
- (void)eventLog:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    NSString * eventID = [doJsonHelper GetOneText: _dictParas :@"id" :@""];
    if(eventID.length<=0)
    {
        [NSException raise:@"umeng" format:@"友盟分享单次统计id无效!",nil];
    }
    NSDictionary* data = [doJsonHelper GetOneValue: _dictParas :@"data"];
    if(data==nil){
        [MobClick event:eventID];
    }else{
        [MobClick event: eventID attributes:data];
    }
}
- (void)eventValueLog:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    NSString * eventID = [doJsonHelper GetOneText: _dictParas :@"id" :@""];
    if(eventID.length<=0)
    {
        [NSException raise:@"umeng" format:@"友盟分享单次统计id无效!",nil];
    }
    NSDictionary* data = [doJsonHelper GetOneValue: _dictParas :@"data"];
    int counter = [doJsonHelper GetOneInteger: _dictParas :@"counter":0];
    if(data==nil){
        data = [[NSDictionary alloc]init];
    }
    [MobClick event: eventID attributes:data counter:counter];

}

//新版sdk不支持
- (void)readConfig:(NSArray *)parms
{
//    NSDictionary *_dictParas = [parms objectAtIndex:0];
//    NSString * configID = [doJsonHelper GetOneText: _dictParas :@"configID" :@""];
//    if(configID.length<=0)
//    {
//        return;
//    }
//    doInvokeResult* _result =[parms objectAtIndex:2];
//    [_result SetResultText:[MobClick getConfigParams:configID]];
}
//新版sdk不支持
- (void)setBackgroundTask:(NSArray *)parms
{
//    NSDictionary *_dictParas = [parms objectAtIndex:0];
//    BOOL isBackground = [doJsonHelper GetOneBoolean: _dictParas :@"value" : NO];
//    [MobClick setBackgroundTaskEnabled:isBackground];
}
- (void)setCrashReportEnabled:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    BOOL isReport = [doJsonHelper GetOneBoolean: _dictParas :@"value" : YES];
    [MobClick setCrashReportEnabled:isReport];
}
- (void)setEncryptLog:(NSArray *)parms
{
    NSDictionary *_dictParas = [parms objectAtIndex:0];
    BOOL isEncrypt = [doJsonHelper GetOneBoolean: _dictParas :@"value" : NO];
    [MobClick setEncryptEnabled:isEncrypt];
}
//异步

@end

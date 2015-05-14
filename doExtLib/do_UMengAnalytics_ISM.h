//
//  do_UMengAnalytics_IMethod.h
//  DoExt_SM
//
//  Created by @userName on @time.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol do_UMengAnalytics_ISM <NSObject>

@required
//实现同步或异步方法，parms中包含了所需用的属性
- (void)beginPageLog:(NSArray *)parms;
- (void)endPageLog:(NSArray *)parms;
- (void)eventLog:(NSArray *)parms;
- (void)eventValueLog:(NSArray *)parms;
- (void)init:(NSArray *)parms;
- (void)readConfig:(NSArray *)parms;
- (void)setBackgroundTask:(NSArray *)parms;
- (void)setCrashReportEnabled:(NSArray *)parms;
- (void)setEncryptLog:(NSArray *)parms;

@end
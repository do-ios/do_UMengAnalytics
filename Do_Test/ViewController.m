//
//  ViewController.m
//  Do_Test
//
//  Created by linliyuan on 15/4/27.
//  Copyright (c) 2015年 DoExt. All rights reserved.
//

#import "ViewController.h"
#import "doPage.h"
#import "doService.h"
#import "do_UMengAnalytics_SM.h"
#import "doIOHelper.h"

@interface ViewController ()
{
@private
    NSString *Type;
    doModule* model;
}
@end
@implementation CallBackEvnet

-(void)eventCallBack:(NSString *)_data
{
    NSLog(@"异步方法回调数据:%@",_data);
}

@end
@implementation ViewController
-(id) init
{
    self = [super init];
    //如果是SM
    model = [[do_UMengAnalytics_SM alloc]init];
    NSMutableDictionary* node = [[NSMutableDictionary alloc]init];
    [node setObject:@"5553dabe67e58ec1df00467a" forKey:@"appKey"];
    [node setObject:@"SEND_INTERVAL" forKey:@"reportPolicy"];
    [node setObject:@"channel1" forKey:@"channel"];
    [[doService Instance] SyncMethod:model :@"init" :node];
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitInstance];
    [self ConfigUI];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void) InitInstance
{
    NSString *testPath = [[NSBundle mainBundle] pathForResource:@"do_Test" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:testPath];
    NSMutableDictionary *_testDics = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    Type = [_testDics valueForKey:@"Type"];
    

}
- (void)ConfigUI {
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    //在对应的测试按钮添加自己的测试代码, 如果6个测试按钮不够，可以自己添加
    
    if([Type isEqualToString:@"UI"]){
        //和SM，MM不一样，UI类型还得添加自己的View，所以测试按钮都在底部
        CGFloat height = h/6;
        CGFloat width = (w - 35)/6;
        for(int i = 0;i<6;i++){
            UIButton *test = [UIButton buttonWithType:UIButtonTypeCustom];
            test.frame = CGRectMake(5*(i+1)+width*i, h-h/6, width, height);
            NSString* title = [NSString stringWithFormat:@"Test%d",i ];
            [test setTitle:title forState:UIControlStateNormal];
            SEL customSelector = NSSelectorFromString([NSString stringWithFormat:@"test%d:",i]);
            [test addTarget:self action:customSelector forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:test];
        }
        //addsubview 自定义的UI
        
    }else{
        CGFloat height = (h-140)/6;
        CGFloat width = w - 60;
        for(int i = 0;i<6;i++){
            UIButton *test = [UIButton buttonWithType:UIButtonTypeCustom];
            test.frame = CGRectMake(30, 20*(i+1)+height*i, width, height);
            NSString* title = [NSString stringWithFormat:@"Test%d",i ];
            [test setTitle:title forState:UIControlStateNormal];
            SEL customSelector = NSSelectorFromString([NSString stringWithFormat:@"test%d:",i]);
            [test addTarget:self action:customSelector forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:test];
        }
    }
}

- (void)test0:(UIButton *)sender
{
    
    
}
- (void)test1:(UIButton *)sender
{
    NSMutableDictionary* node = [[NSMutableDictionary alloc]init];
    [node setObject:@"test11" forKey:@"id"];
    NSMutableDictionary* data = [[NSMutableDictionary alloc]init];
    [data setObject:@"key1" forKey:@"key"];
    [data setObject:@"value2" forKey:@"value"];
    [node setObject:data forKey:@"data"];
    [[doService Instance] SyncMethod:model :@"eventLog" :node];
}
- (void)test2:(UIButton *)sender
{
    NSMutableDictionary* node = [[NSMutableDictionary alloc]init];
    [node setObject:@"test12" forKey:@"id"];
    NSMutableDictionary* data = [[NSMutableDictionary alloc]init];
    [data setObject:@"key2" forKey:@"key"];
    [data setObject:@"value3" forKey:@"value"];
    [node setObject:data forKey:@"data"];
    [node setObject:[NSNumber numberWithInt:23] forKey:@"counter"];
    [[doService Instance] SyncMethod:model :@"eventValueLog" :node];

}
- (void)test3:(UIButton *)sender
{

}
- (void)test4:(UIButton *)sender
{

}
- (void)test5:(UIButton *)sender
{
    NSLog(@"请添加自己的测试代码");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    NSMutableDictionary* node = [[NSMutableDictionary alloc]init];
    [node setObject:@"page1" forKey:@"pageName"];
    [[doService Instance] SyncMethod:model :@"beginPageLog" :node];

}

- (void)viewWillDisappear:(BOOL)animated
{
    NSMutableDictionary* node = [[NSMutableDictionary alloc]init];
    [node setObject:@"page1" forKey:@"pageName"];
    [[doService Instance] SyncMethod:model :@"endPageLog" :node];
}//
@end

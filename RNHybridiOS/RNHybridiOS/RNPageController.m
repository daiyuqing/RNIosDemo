//
//  RNPageController.m
//  RNHybridiOS
//
//  Created by 前端组 on 2019/8/1.
//  Copyright © 2019 前端组. All rights reserved.
//

#import "RNPageController.h"
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

@interface RNPageController ()

@end

@implementation RNPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initRCTRootView];
}
- (void)initRCTRootView{
    NSURL *jsCodeLocation;
    
    // jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
    //手动拼接jsCodeLocation用于开发环境
    //jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    //release之后从包中读取名为main的静态js bundle
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    // 通过RCTBundleURLProvider生成，用于开发环境
    //这个"App1"名字一定要和我们在index.js中注册的名字保持一致
    RCTRootView *rootView =[[RCTRootView alloc] initWithBundleURL:jsCodeLocation moduleName: @"iOSHybridRNDemo" initialProperties:
                            @{
                              @"scores" : @[
                                      @{
                                          @"name" : @"Alex",
                                          @"value": @"42"
                                          },
                                      @{
                                          @"name" : @"Joel",
                                          @"value": @"10"
                                          }
                                      ]
                              }                                                    launchOptions: nil];
    
    self.view=rootView;
   
}

@end

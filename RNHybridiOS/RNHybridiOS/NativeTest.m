
#import "NativeTest.h"

@implementation NativeTest

// 导出模块，不添加参数即默认为这个类名
RCT_EXPORT_MODULE();

// 导出方法，桥接到js的方法返回值类型必须是void
/* 回调参数必须为两个，第一个为状态，第二个为参数 */
RCT_EXPORT_METHOD(doSomething:(NSString *)testStr resolver:(RCTResponseSenderBlock)callback){
    NSLog(@"%@ ===> doSomething",testStr);
    NSString *callbackData = @"Callback数据"; //准备回调回去的数据
    callback(@[[NSNull null],callbackData]);
}

@end


#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNTest : RCTEventEmitter <RCTBridgeModule>
+ (instancetype)shareInstance;
@end


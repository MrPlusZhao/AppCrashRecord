//
//  TPCrashRecord.h
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TPCrashRecord : NSObject

@property (nonatomic, assign) BOOL isPush;//进入VC
@property (nonatomic, assign) BOOL isAllow;//是否开启了crash捕捉工具


/// 安装crash捕捉工具
+ (void)Install;

/// 记录操作行为
+ (void)addCrashRecord:(NSString*)content;

/// 获取本地的崩溃日志
+ (NSArray*)getExceptionFileList;

+ (instancetype)share;



@end

NS_ASSUME_NONNULL_END

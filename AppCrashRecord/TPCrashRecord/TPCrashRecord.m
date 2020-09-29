//
//  TPCrashRecord.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/27.
//

#import "TPCrashRecord.h"

#define MY [TPCrashRecord share]

@interface TPCrashRecord ()

@property (nonatomic, strong) NSMutableArray *trackArr;
@end

@implementation TPCrashRecord

+ (void)Install{
    [MY InstallCrashHandle];
    MY.isAllow = YES;
}
/// 安装crash捕捉工具
- (void)InstallCrashHandle{
    NSSetUncaughtExceptionHandler(&RunTPCrashRecord);
}
void RunTPCrashRecord(NSException *exception){
    [TPCrashRecord CheckException:exception];
}
/// 记录操作行为
+ (void)addCrashRecord:(NSString*)content
{
    [MY.trackArr addObject:content];
}
/// 整理崩溃信息
+ (void)CheckException:(NSException *)exception
{
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HHmmss"];
    NSString *crashTime = [formatter stringFromDate:[NSDate date]];
    //异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    //出现异常的原因
    NSString *reason = [exception reason];
    //异常名称
    NSString *name = [exception name];
    // 行为路径
    NSString *trackInfo = [MY.trackArr componentsJoinedByString:@"->"];
    //拼接错误信息
    NSString *exceptionInfo = [NSString stringWithFormat:@"CrashTime: %@\n", crashTime];
    exceptionInfo = [exceptionInfo stringByAppendingString:[NSString stringWithFormat:@"Exception reason: %@\n",reason]];
    exceptionInfo = [exceptionInfo stringByAppendingString:[NSString stringWithFormat:@"Exception name: %@\n",name]];
    exceptionInfo = [exceptionInfo stringByAppendingString:[NSString stringWithFormat:@"Exception action: %@\n",trackInfo]];
    exceptionInfo = [exceptionInfo stringByAppendingString:[NSString stringWithFormat:@"Exception call stack: %@\n",stackArray]];
    // 如果有别的信息需要记录, 可以继续追加 .....   uid ?? age?? phoneNum ??
    [TPCrashRecord SaveCrash:exceptionInfo Time:crashTime];
    NSLog(@"exceptionInfo ==\n%@",exceptionInfo);
    
    
}
+ (void)SaveCrash:(NSString*)content Time:(NSString*)crashTime
{
    NSString *crashFoloder = @"TPCrashLogs";
    NSString *crashLogPath = [NSString stringWithFormat:@"%@/%@", [MY applicationDocumentsDirectory],crashFoloder];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:crashLogPath]) {
        [manager createDirectoryAtPath:crashLogPath withIntermediateDirectories:true attributes:nil error:nil];
    }
    crashLogPath = [crashLogPath stringByAppendingFormat:@"/%@.log",crashTime];
    NSError *error = nil;
    NSLog(@"%@", crashLogPath);
    BOOL isSuccess = [content writeToFile:crashLogPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!isSuccess) {
        NSLog(@"将crash信息保存到本地失败: %@", error.userInfo);
    }
}
+ (NSArray*) getExceptionFileList
{
    NSArray* files = [TPCrashRecord getFilenamesWithDir : [MY applicationDocumentsDirectory]];
    if (!files) {
        return nil;//没有存的文件
    }
    NSMutableArray* temp = [NSMutableArray array];
    for(NSString* file in files)
    {
        NSString* ext = [file pathExtension];
        NSString *crashFoloder = @"TPCrashLogs";
        NSString *crashLogPath = [NSString stringWithFormat:@"%@/%@", [MY applicationDocumentsDirectory],crashFoloder];
        NSString* filePath = [crashLogPath stringByAppendingPathComponent: file];
        if ([ext rangeOfString:@"log"].location != NSNotFound)
        {
            BOOL isDir = NO;
            BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDir];
            if (exists && !isDir) [temp addObject : filePath];
        }
    }
    return temp;
}
+(NSArray*)getFilenamesWithDir:(NSString*)dir
{
    NSString *crashFoloder = @"TPCrashLogs";
    NSString *crashLogPath = [NSString stringWithFormat:@"%@/%@", [MY applicationDocumentsDirectory],crashFoloder];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:crashLogPath]) {
        return nil;
    }
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:crashLogPath error:nil];
    return fileList;
}
- (NSString*) applicationDocumentsDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

- (NSMutableArray *)trackArr{
    if (!_trackArr) {
        _trackArr = [NSMutableArray array];
    }
    return _trackArr;
}
+ (instancetype)share{
    return  [[self alloc] init];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static TPCrashRecord* _singleton;
    static dispatch_once_t onceToken;
    // 一次函数
    dispatch_once(&onceToken, ^{
        if (_singleton == nil) {
            _singleton = [super allocWithZone:zone];
        }
    });
    return _singleton;
}
@end

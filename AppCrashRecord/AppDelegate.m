//
//  AppDelegate.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/25.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TPCrashRecord.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIViewController *VC = [[ViewController alloc]init];
    UINavigationController *rootVC = [[UINavigationController alloc]initWithRootViewController:VC];
//    安装crash捕捉工具
    [self InstallCrashTool];
    
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (void)InstallCrashTool
{
    // 1: 安装crash捕捉工具
    [TPCrashRecord Install];
    // 2: 获取本地的崩溃日志, 上传到服务器
    NSArray *arr = [TPCrashRecord getExceptionFileList];
    NSLog(@"%@",arr);//    上传 --- arr
}

@end

//
//  UIViewController+TPCrashRecord.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/28.
//

#import "UIViewController+TPCrashRecord.h"
#import "TPCrashRecord.h"
#include <objc/message.h>

@implementation UIViewController (TPCrashRecord)

+ (void)load {
    
    [self TPSwizzing:self methodOld:@selector(viewDidLoad) methodNew:@selector(TPCrash_viewDidLoad)];
    [self TPSwizzing:self methodOld:@selector(viewDidDisappear:) methodNew:@selector(TPCrash_viewDidDisappear)];

}
- (void)TPCrash_viewDidLoad
{
    // 没有开启工具,不进行记录
    if (![[TPCrashRecord share] isAllow]) {return;}
    if (![self isKindOfClass:BaseViewController.class]) {return;}
    NSString *name =  [self getViewControllerString];
    [[TPCrashRecord share] setIsPush:YES];
    [TPCrashRecord addCrashRecord:[NSString stringWithFormat:@"(进入)%@",name]];
    
}
- (void)TPCrash_viewDidDisappear
{
    // 没有开启工具,不进行记录
    if (![[TPCrashRecord share] isAllow]) {return;}
    if (![self isKindOfClass:BaseViewController.class]) {return;}
    if ([TPCrashRecord share].isPush) {
        [[TPCrashRecord share] setIsPush:NO];
        return;
    }
    NSString *name =  [self getViewControllerString];
    [TPCrashRecord addCrashRecord:[NSString stringWithFormat:@"(离开)%@",name]];
}

- (NSString*) getViewControllerString
{
    return [NSString stringWithFormat:@"%@", NSStringFromClass(self.class)];
}
+ (void)TPSwizzing:(Class)className methodOld:(SEL)oldMethod methodNew:(SEL)newMethod
{
    Method originalMethod = class_getInstanceMethod(className, oldMethod);
    Method swizzledMethod = class_getInstanceMethod(className, newMethod);
    
    BOOL AddMethod = class_addMethod(className, oldMethod, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (AddMethod) {
        class_replaceMethod(className, oldMethod, class_getMethodImplementation(className, newMethod), method_getTypeEncoding(swizzledMethod));
    }
    else
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end

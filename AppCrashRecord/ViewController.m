//
//  ViewController.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/25.
//

#import "ViewController.h"
#import "TPCrashRecord.h"
#import "ViewControllerA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    UIButton * but = [UIButton buttonWithType:UIButtonTypeContactAdd];
    but.center = self.view.center;
    [but addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
- (void)push
{
    [self.navigationController pushViewController:[ViewControllerA new] animated:YES];
}
@end

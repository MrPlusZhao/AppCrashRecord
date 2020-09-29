//
//  ViewControllerA.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/27.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA ()

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.yellowColor;
    UIButton * but = [UIButton buttonWithType:UIButtonTypeContactAdd];
    but.center = self.view.center;
    [but addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
- (void)push
{
    [self.navigationController pushViewController:[ViewControllerB new] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

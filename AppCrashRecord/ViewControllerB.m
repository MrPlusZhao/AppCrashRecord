//
//  ViewControllerB.m
//  AppCrashRecord
//
//  Created by zhaotianpeng on 2020/9/27.
//

#import "ViewControllerB.h"
#import "ViewControllerC.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
    UIButton * but = [UIButton buttonWithType:UIButtonTypeContactAdd];
    but.center = self.view.center;
    [but addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
- (void)push
{
    [self.navigationController pushViewController:[ViewControllerC new] animated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",@[@"1"][5]);
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

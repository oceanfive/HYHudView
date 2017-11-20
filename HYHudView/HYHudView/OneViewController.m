//
//  OneViewController.m
//  HYHudView
//
//  Created by ocean on 2017/11/20.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "OneViewController.h"
#import "HYHud.h"
#import "UIView+HYHud.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"--------");
//    [HYHud hy_showTextOnly:@"hello world" offset:CGPointMake(0, 200) contentColor:[UIColor redColor] duration:10.0f];
    
//    [self.view hy_showTextOnly:@"hello world" offset:CGPointMake(0, 200) contentColor:[UIColor redColor] duration:10.0f];

    
    [HYHud hy_showText:@"hello world ! nice to meet you ! hahhahha ! how are you ? i am fine, thank you" offset:CGPointMake(0, 200) contentColor:[UIColor redColor]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HYHud hy_hide];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

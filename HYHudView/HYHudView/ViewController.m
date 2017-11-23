//
//  ViewController.m
//  HYHudView
//
//  Created by ocean on 2017/11/6.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "ViewController.h"
#import "HYHud.h"
#import "OneViewController.h"
#import <MBProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = @"label";
    hud.detailsLabel.text = @"detailsLabel";
    hud.offset = CGPointZero;
    hud.progress = 0.5;
    hud.contentColor = [UIColor redColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    OneViewController *vc = [[OneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

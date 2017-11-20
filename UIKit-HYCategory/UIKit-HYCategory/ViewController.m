//
//  ViewController.m
//  UIKit-HYCategory
//
//  Created by ocean on 2017/11/14.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test_colors];

    NSString *hex = @"1001";
    NSData *data = [hex dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"data:%@", data);
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"result:%@", result);
    NSInteger integer = [hex integerValue];
    NSLog(@"integer:%ld", (long)integer);
    
    //16进制转10进制
    unsigned hexInt;
    [[[NSScanner alloc] initWithString:hex] scanHexInt:&hexInt];
    unsigned long long hexLong;
    [[[NSScanner alloc] initWithString:hex] scanHexLongLong:&hexLong];

    NSLog(@"%d", hexInt);
    NSLog(@"%lld", hexLong);
    
    /*
     ff  0xff  0Xff
     FF  0xFF  0XFF
     fF  0xfF  0XfF
     Ff  0xFf  0XFf
     
     结果都是255
     */
    NSLog(@"----------------------");

    //2进制转10进制
//    NSDecimalNumber
    int Int;
    [[[NSScanner alloc] initWithString:hex] scanInt:&Int];
    long long Long;
    [[[NSScanner alloc] initWithString:hex] scanLongLong:&Long];

    NSLog(@"%d", Int);
    NSLog(@"%lld", Long);
//
    
//    NSScanner
    
}


- (void)test_colors {
    NSMutableArray *colors = [NSMutableArray array];
    [colors addObject:[UIColor redColor]];
    [colors addObject:[UIColor blueColor]];
    [colors addObject:[UIColor orangeColor]];
    
    
    //    self.view.backgroundColor = [UIColor hy_gradientColorWith:HYGradientColorDirectionFromTopToBottom colors:colors size:self.view.size];
//    self.view.backgroundColor = [UIColor hy_gradientColorWithStartPoint:CGPointMake(0, 0.25) endPoint:CGPointMake(1, 1) locations:@[@0.1, @0.8, @0.9] colors:colors size:self.view.hy_size];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

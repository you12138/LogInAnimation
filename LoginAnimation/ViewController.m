//
//  ViewController.m
//  LoginAnimation
//
//  Created by whn on 2016/12/13.
//  Copyright © 2016年 kk. All rights reserved.
//

#import "ViewController.h"

#import "KKAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *test = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [test setTitle:@"登陆" forState:(UIControlStateNormal)];
    test.frame = CGRectMake(0, 0, 80, 30);
    test.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 100);
    test.backgroundColor = [UIColor orangeColor];
    [test addTarget:self action:@selector(testAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:test];
    
}


- (void)testAction
{
    KKAnimationView *animationView = [[KKAnimationView alloc] initWithTitleArray:@[@"QQ", @"空间", @"微信", @"朋友圈"] picArray:@[@"qq", @"zone", @"wechat", @"pyq"]];
    
    [animationView selectedWithIndex:^(NSInteger index) {
       
        NSLog(@"你选择的index是%ld", index);
        
    }];
    
    [animationView KKBtnBlock:^(UIButton *btn) {
        NSLog(@"你点了选择/取消按钮");
    }];
    
    [animationView show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

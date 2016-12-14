//
//  KKView.m
//  LoginAnimation
//
//  Created by whn on 2016/12/14.
//  Copyright © 2016年 kk. All rights reserved.
//

#import "KKView.h"

@implementation KKView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _iconBtn.frame = CGRectMake(self.frame.size.width/2-25, 0, 50, 50);
        _iconBtn.clipsToBounds = YES;
        _iconBtn.layer.cornerRadius = 25;
//        _iconBtn.center = self.center;
        [_iconBtn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        _iconBtn.backgroundColor = [UIColor redColor];
        
        self.iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, 20)];
        [_iconLabel setTextAlignment:(NSTextAlignmentCenter)];
        _iconLabel.font = [UIFont systemFontOfSize:14];
        _iconLabel.text = @"测试";
        _iconLabel.textColor = [UIColor blackColor];
        [self addSubview:self.iconBtn];
        [self addSubview:self.iconLabel];
        
    }
    return self;
}


- (void)selectedIndex:(KKBlock)block
{
    self.block = block;
}

- (void)btnClick:(UIButton *)sender
{
    self.block(self.iconBtn.tag);
}

@end

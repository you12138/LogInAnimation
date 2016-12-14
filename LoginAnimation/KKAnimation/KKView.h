//
//  KKView.h
//  LoginAnimation
//
//  Created by whn on 2016/12/14.
//  Copyright © 2016年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KKBlock)(NSInteger index);


@interface KKView : UIView


@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UILabel *iconLabel;

@property (nonatomic, copy) KKBlock block;

- (void)selectedIndex:(KKBlock)block;


@end

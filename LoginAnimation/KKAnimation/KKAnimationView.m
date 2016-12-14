//
//  KKAnimationView.m
//  LoginAnimation
//
//  Created by whn on 2016/12/14.
//  Copyright © 2016年 kk. All rights reserved.
//

#import "KKAnimationView.h"
#import "KKView.h"
#define HH         130
#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height


@interface KKAnimationView ()

@property (nonatomic, strong) UIView *largeView;

@property (nonatomic, assign) CGFloat count;

@property (nonatomic, strong) UIButton *chooseBtn;

@end

@implementation KKAnimationView

- (id)initWithTitleArray:(NSArray *)titleArray picArray:(NSArray *)picArray
{
    self = [super init];
    
    if (self) {
        
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
        self.largeView = [UIView new];
        _largeView.frame = CGRectMake(0, kScreenH, kScreenW, HH);
        _largeView.backgroundColor = [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
        _largeView.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:_largeView];
        
        __weak typeof(self) weakSelf = self;
        
        self.chooseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _chooseBtn.frame = CGRectMake(0, HH - 40, kScreenW, 40);
        [_chooseBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        [_chooseBtn setBackgroundColor:[UIColor brownColor]];
        [_chooseBtn addTarget:self action:@selector(chooseBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [_largeView addSubview:_chooseBtn];
        
        for (int i = 0; i < 4; i++) {
            
            KKView *kk = [[KKView alloc] initWithFrame:CGRectMake(i%4*(kScreenW/4), 20, kScreenW/4, 90)];
           
            kk.tag = 100+i;
            kk.iconBtn.tag = i+1;
            [kk.iconBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", picArray[i]]] forState:(UIControlStateNormal)];
            [kk.iconLabel setText:[NSString stringWithFormat:@"%@", titleArray[i]]];
            [kk selectedIndex:^(NSInteger index) {
               
                [self dismiss];
                self.indexBlock(index);
                
            }];
            
            [self.largeView addSubview:kk];
            
        }
        
        UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(dismiss)];
        [weakSelf addGestureRecognizer:dismissTap];
    }
    return self;
}

- (void)selectedWithIndex:(KKIndexBlock)block
{
    self.indexBlock = block;
}

- (void)KKBtnBlock:(KKBtnBlock)block
{
    self.btnBlock = block;
}

- (void)chooseBtnAction:(UIButton *)sender
{
    self.btnBlock(sender);
    [self dismiss];
}


- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:(UIViewAnimationCurveEaseOut)];
        _largeView.transform = CGAffineTransformMakeTranslation(0, -HH);
    } completion:^(BOOL finished) {
       
        for (int i = 0; i < 4; i ++) {
            
            CGPoint location = CGPointMake(kScreenW / 4 * (i%4) + (kScreenW / 8), 45);
            
            KKView *kk = (KKView *)[self viewWithTag:100 + i];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.03 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:(UIViewAnimationOptionCurveEaseOut) animations:^{
                    
                    kk.center = location;
                    
                } completion:nil];
                
            });
            
        }
        
    }];
}


- (void)tap:(UITapGestureRecognizer *)tapG {
    [self dismiss];
}


- (void)dismiss
{
    [UIView animateWithDuration:0 animations:^{
        
        [UIView setAnimationCurve:(UIViewAnimationCurveEaseIn)];
        _largeView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

@end

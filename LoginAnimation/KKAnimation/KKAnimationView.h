//
//  KKAnimationView.h
//  LoginAnimation
//
//  Created by whn on 2016/12/14.
//  Copyright © 2016年 kk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^KKIndexBlock)(NSInteger index);

typedef void(^KKBtnBlock)(UIButton *btn);

@interface KKAnimationView : UIView

@property (nonatomic, copy) KKIndexBlock indexBlock;

@property (nonatomic, copy) KKBtnBlock btnBlock;

/**
 * 初始化动画视图
 * 
 * @param titleArray title数组
 * @param picArray   图标数组
 *
 */

- (id)initWithTitleArray:(NSArray *)titleArray picArray:(NSArray *)picArray;

/**
 * 视图展示
 */
- (void)show;

/**
 * 选中的index
 */
- (void)selectedWithIndex:(KKIndexBlock)block;

/**
 * 按钮block
 */
- (void)KKBtnBlock:(KKBtnBlock)block;



@end

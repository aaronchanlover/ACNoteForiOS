//
//  MBProgressHUD+Category.h
//  ACNoteForiOS
//
//  Created by ChenJun on 16/5/11.
//  Copyright © 2016年 arron. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Category)

extern NSString *const kBWMMBProgressHUDMsgLoading;
extern NSString *const kBWMMBProgressHUDMsgLoadError;
extern NSString *const kBWMMBProgressHUDMsgLoadSuccessful;
extern NSString *const kBWMMBProgressHUDMsgNoMoreData;
extern NSTimeInterval kBWMMBProgressHUDHideTimeInterval;

typedef NS_ENUM(NSUInteger, BWMMBProgressHUDMsgType) {
  BWMMBProgressHUDMsgTypeSuccessful,
  BWMMBProgressHUDMsgTypeError,
  BWMMBProgressHUDMsgTypeWarning,
  BWMMBProgressHUDMsgTypeInfo
};

/**
 *  @brief  添加一个带菊花的HUD
 *
 *  @param view  目标view
 *  @param title 标题
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ex_showHUDAddedTo:(UIView *)view title:(NSString *)title;
/** 添加一个带菊花的HUD */
+ (MBProgressHUD *)ex_showHUDAddedTo:(UIView *)view
                                title:(NSString *)title
                             animated:(BOOL)animated;

/**
 *  @brief  隐藏指定的HUD
 *
 *  @param afterSecond 多少秒后
 */
- (void)ex_hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)ex_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond;
/** 隐藏指定的HUD */
- (void)ex_hideWithTitle:(NSString *)title
                hideAfter:(NSTimeInterval)afterSecond
                  msgType:(BWMMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个自定的HUD
 *
 *  @param title       标题
 *  @param view        目标view
 *  @param afterSecond 持续时间
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ex_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond;
/** 显示一个自定的HUD */
+ (MBProgressHUD *)ex_showTitle:(NSString *)title
                          toView:(UIView *)view
                       hideAfter:(NSTimeInterval)afterSecond
                         msgType:(BWMMBProgressHUDMsgType)msgType;

/**
 *  @brief  显示一个渐进式的HUD
 *
 *  @param view 目标view
 *
 *  @return MBProgressHUD
 */
+ (MBProgressHUD *)ex_showDeterminateHUDTo:(UIView *)view;

/** 配置本扩展的默认参数 */
+ (void)ex_setHideTimeInterval:(NSTimeInterval)second
                       fontSize:(CGFloat)fontSize
                        opacity:(CGFloat)opacity;

@end

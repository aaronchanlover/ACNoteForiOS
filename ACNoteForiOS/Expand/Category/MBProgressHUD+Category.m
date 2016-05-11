//
//  MBProgressHUD+Category.m
//  ACNoteForiOS
//
//  Created by ChenJun on 16/5/11.
//  Copyright © 2016年 arron. All rights reserved.
//

#import "MBProgressHUD+Category.h"

NSString *const kBWMMBProgressHUDMsgLoading = @"正在加载...";
NSString *const kBWMMBProgressHUDMsgLoadError = @"加载失败";
NSString *const kBWMMBProgressHUDMsgLoadSuccessful = @"加载成功";
NSString *const kBWMMBProgressHUDMsgNoMoreData = @"没有更多数据了";
NSTimeInterval kBWMMBProgressHUDHideTimeInterval = 1.2f;

static CGFloat FONT_SIZE = 14.0f;
static CGFloat OPACITY = 0.85;

@implementation MBProgressHUD (Category)

+ (MBProgressHUD *)ex_showHUDAddedTo:(UIView *)view
                               title:(NSString *)title
                            animated:(BOOL)animated {
  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:animated];
  HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
  HUD.labelText = title;
  HUD.opacity = OPACITY;
  return HUD;
}

+ (MBProgressHUD *)ex_showHUDAddedTo:(UIView *)view title:(NSString *)title {
  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
  HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
  HUD.labelText = title;
  HUD.opacity = OPACITY;
  return HUD;
}

- (void)ex_hideWithTitle:(NSString *)title
               hideAfter:(NSTimeInterval)afterSecond {
  if (title) {
    self.labelText = title;
    self.mode = MBProgressHUDModeText;
  }
  [self hide:YES afterDelay:afterSecond];
}

- (void)ex_hideAfter:(NSTimeInterval)afterSecond {
  [self hide:YES afterDelay:afterSecond];
}

- (void)ex_hideWithTitle:(NSString *)title
               hideAfter:(NSTimeInterval)afterSecond
                 msgType:(BWMMBProgressHUDMsgType)msgType {
  self.labelText = title;
  self.mode = MBProgressHUDModeCustomView;
  self.customView = [[UIImageView alloc]
      initWithImage:[UIImage imageNamed:[[self class]
                                            p_imageNamedWithMsgType:msgType]]];
  [self hide:YES afterDelay:afterSecond];
}

+ (MBProgressHUD *)ex_showTitle:(NSString *)title
                         toView:(UIView *)view
                      hideAfter:(NSTimeInterval)afterSecond {
  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
  HUD.mode = MBProgressHUDModeText;
  HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
  HUD.labelText = title;
  HUD.opacity = OPACITY;
  [HUD hide:YES afterDelay:afterSecond];
  return HUD;
}

+ (MBProgressHUD *)ex_showTitle:(NSString *)title
                         toView:(UIView *)view
                      hideAfter:(NSTimeInterval)afterSecond
                        msgType:(BWMMBProgressHUDMsgType)msgType {

  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
  HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];

  NSString *imageNamed = [self p_imageNamedWithMsgType:msgType];

  HUD.customView =
      [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
  HUD.labelText = title;
  HUD.opacity = OPACITY;
  HUD.mode = MBProgressHUDModeCustomView;
  [HUD hide:YES afterDelay:afterSecond];
  return HUD;
}

+ (NSString *)p_imageNamedWithMsgType:(BWMMBProgressHUDMsgType)msgType {
  NSString *imageNamed = nil;
  if (msgType == BWMMBProgressHUDMsgTypeSuccessful) {
    imageNamed = @"ex_hud_success";
  } else if (msgType == BWMMBProgressHUDMsgTypeError) {
    imageNamed = @"ex_hud_error";
  } else if (msgType == BWMMBProgressHUDMsgTypeWarning) {
    imageNamed = @"ex_hud_warning";
  } else if (msgType == BWMMBProgressHUDMsgTypeInfo) {
    imageNamed = @"ex_hud_info";
  }
  return imageNamed;
}

+ (MBProgressHUD *)ex_showDeterminateHUDTo:(UIView *)view {
  MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
  HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
  HUD.animationType = MBProgressHUDAnimationZoom;
  HUD.labelText = kBWMMBProgressHUDMsgLoading;
  HUD.labelFont = [UIFont systemFontOfSize:FONT_SIZE];
  return HUD;
}

+ (void)ex_setHideTimeInterval:(NSTimeInterval)second
                      fontSize:(CGFloat)fontSize
                       opacity:(CGFloat)opacity {
  kBWMMBProgressHUDHideTimeInterval = second;
  FONT_SIZE = fontSize;
  OPACITY = opacity;
}

@end

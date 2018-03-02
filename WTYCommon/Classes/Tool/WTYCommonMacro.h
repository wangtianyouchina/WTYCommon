//
//  WTYCommonMacro.h
//  WTYCommon
//
//  Created by 王天佑 on 2018/3/2.
//

#ifndef WTYCommonMacro_h
#define WTYCommonMacro_h

//color
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBColor(r, g, b) RGBAColor(r,g,b,1.0)
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



//Weak Strong Self
#define __WEAKSELF(X)    __weak typeof(X) weakSelf = X;
#define __STRONGSELF(X)  __strong typeof(X) strongSelf = X;

#define kTabBarHight 49
#define kStatusBarHight (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
#define kScreenHeight [UIScreen mainScreen].bounds.size.height  //屏幕的高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width    //屏幕的宽度

#define isiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [UIScreen mainScreen].bounds.size) : NO) //3.5 Inch

#define isiPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO) //3.5 Inch
#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO) //4.0 Inch
#define isiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO) //4.7 Inch
#define isiPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO) //5.5 Inch

#define isiPhoneX  ((kStatusBarHight > 20)?YES:NO)
//设置是否调试模式

#ifdef DEBUG
#define NSLog(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(xx, ...)  //((void)0)
#endif // #ifdef DEBUG


#endif /* WTYCommonMacro_h */

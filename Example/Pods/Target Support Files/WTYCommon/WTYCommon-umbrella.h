#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "WTYDateTool.h"
#import "WTYFileManager.h"
#import "WTYPathManager.h"

FOUNDATION_EXPORT double WTYCommonVersionNumber;
FOUNDATION_EXPORT const unsigned char WTYCommonVersionString[];


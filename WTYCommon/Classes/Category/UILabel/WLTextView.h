//
//  WLTextView.h
//  ZDWuliu
//
//  Created by kede Han on 2017/4/13.
//  Copyright © 2017年 jiangqichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTextView : UITextView
@property (assign, nonatomic) UIEdgeInsets insets;
- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets;
- (id)initWithInsets:(UIEdgeInsets)insets;
@end

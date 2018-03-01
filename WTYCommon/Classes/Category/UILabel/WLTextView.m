//
//  WLTextView.m
//  ZDWuliu
//
//  Created by kede Han on 2017/4/13.
//  Copyright © 2017年 jiangqichen. All rights reserved.
//

#import "WLTextView.h"

@implementation WLTextView

- (void)setInsets:(UIEdgeInsets)insets{
    
    _insets = insets;
}

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets)insets{
    
    if (self = [super initWithFrame:frame]) {
        
        self.insets = insets;
    }
    return self;
}

- (id)initWithInsets:(UIEdgeInsets)insets{
    
    if (self = [super init]) {
        
        self.insets = insets;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{

    return [super drawRect:UIEdgeInsetsInsetRect(rect, self.insets)];

}
@end

//
//

#import "UIView+Basic.h"

@implementation UIView(Basic)

- (float)current_x
{
    return self.frame.origin.x;
}
- (float)current_y
{
    return self.frame.origin.y;
}
- (float)current_w
{
    return self.frame.size.width;
}
- (float)current_h
{
    return self.frame.size.height;
}
- (float)current_y_h
{
    return self.frame.size.height + self.frame.origin.y;
}
- (float)current_x_w
{
    return self.frame.size.width + self.frame.origin.x;
}
- (CGPoint)current_innerCenter
{
    return CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}
@end

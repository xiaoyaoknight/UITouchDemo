//
//  PDTapGestureRecognizer.m
//  UITouchDemo
//
//  Created by 王泽龙 on 2019/4/10.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "PDTapGestureRecognizer.h"

@implementation PDTapGestureRecognizer

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s,%s",object_getClassName(self.view), __func__);
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s,%s",object_getClassName(self.view), __func__);
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s,%s",object_getClassName(self.view), __func__);
    [super touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s,%s",object_getClassName(self.view), __func__);
    [super touchesCancelled:touches withEvent:event];
}
@end

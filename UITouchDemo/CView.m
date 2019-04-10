//
//  CView.m
//  UITouchDemo
//
//  Created by 王泽龙 on 2019/4/10.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "CView.h"

@implementation CView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    return [super pointInside:point withEvent:event];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}

@end

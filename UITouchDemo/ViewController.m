//
//  ViewController.m
//  UITouchDemo
//
//  Created by 王泽龙 on 2019/4/10.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "BView.h"
#import "CView.h"
#import "DView.h"
#import "PDTapGestureRecognizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
    [self test5];
}


/**
 C 超出父视图B范围，点击的时候 响应者是A
 */
- (void)test1 {
    
    AView *a = [[AView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    a.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:a];
    
    
    BView *b = [[BView alloc] initWithFrame:CGRectMake(0, 400, 300, 300)];
    b.backgroundColor = [UIColor greenColor];
    [self.view addSubview:b];
    
    
    CView *c = [[CView alloc] initWithFrame:CGRectMake(100, -50, 100, 100)];
    c.backgroundColor = [UIColor blueColor];
    [b addSubview:c];
}

/**
 系统手势
 */
- (void)test2 {
    
    AView *a = [[AView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    a.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:a];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapGesture)];
    [a addGestureRecognizer:tap];
    /*
     2019-04-10 15:35:46.638139+0800 UITouchDemo[27870:11270406] -[AView touchesMoved:withEvent:]
     2019-04-10 15:35:46.694598+0800 UITouchDemo[27870:11270406] taped
     2019-04-10 15:35:46.694840+0800 UITouchDemo[27870:11270406] -[AView touchesCancelled:withEvent:]
     */
}

/**
 自定义手势，打印事件
 事件最先传递给了手势识别器，
 然后传递给了最佳响应者，
 在手势识别器识别成功手势后，调用最佳响应者的touchesCancelled:方法终止最佳响应者对于事件的响应。
 */
- (void)test3 {
    
    AView *a = [[AView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
    a.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:a];
    
    PDTapGestureRecognizer *tap = [[PDTapGestureRecognizer alloc] init];
    [tap addTarget:self action:@selector(tapGesture)];
    [a addGestureRecognizer:tap];
    
    /*
     2019-04-10 15:38:07.817890+0800 UITouchDemo[27976:11273239] AView,-[PDTapGestureRecognizer touchesBegan:withEvent:]
     2019-04-10 15:38:07.818411+0800 UITouchDemo[27976:11273239] -[AView touchesBegan:withEvent:]
     2019-04-10 15:38:07.895386+0800 UITouchDemo[27976:11273239] AView,-[PDTapGestureRecognizer touchesEnded:withEvent:]
     2019-04-10 15:38:07.895828+0800 UITouchDemo[27976:11273239] taped
     2019-04-10 15:38:07.896042+0800 UITouchDemo[27976:11273239] -[AView touchesCancelled:withEvent:]
     */

}

- (void)tapGesture{
    NSLog(@"taped");
}


/**
 当响应链上有手势识别器时，事件在传递过程中一定会先传递给响应链上的手势识别器，然后才传递给最佳响应者，当响应链上的手势识别了手势后就会取消最佳响应者对于事件的响应。事件传递给响应链上的手势识别器时是乱序的，并不是按照响应链从顶至底传递，但是最后响应的函数还是响应链最顶端的手势识别器函数。
 */
- (void)test4{
    
    AView *a = [[AView alloc] initWithFrame:CGRectMake(0, 0, 375, 700)];
    a.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:a];
    PDTapGestureRecognizer *tapA = [[PDTapGestureRecognizer alloc] init];
    [tapA addTarget:self action:@selector(tapGestureA)];
    [a addGestureRecognizer:tapA];
    
    BView *b = [[BView alloc] initWithFrame:CGRectMake(0, 200, 320, 500)];
    b.backgroundColor = [UIColor greenColor];
    [a addSubview:b];
    PDTapGestureRecognizer *tapB = [[PDTapGestureRecognizer alloc] init];
    [tapB addTarget:self action:@selector(tapGestureB)];
    [b addGestureRecognizer:tapB];
    
    CView *c = [[CView alloc] initWithFrame:CGRectMake(50, 50, 240, 400)];
    c.backgroundColor = [UIColor blueColor];
    [b addSubview:c];
    PDTapGestureRecognizer *tapC = [[PDTapGestureRecognizer alloc] init];
    [tapC addTarget:self action:@selector(tapGestureC)];
    [c addGestureRecognizer:tapC];
    
    DView *d = [[DView alloc] initWithFrame:CGRectMake(50, 50, 180, 300)];
    d.backgroundColor = [UIColor purpleColor];
    [c addSubview:d];
    PDTapGestureRecognizer *tapD = [[PDTapGestureRecognizer alloc] init];
    [tapD addTarget:self action:@selector(tapGestureD)];
    [d addGestureRecognizer:tapD];
}

- (void)test5 {
    
    AView *a = [[AView alloc] initWithFrame:CGRectMake(0, 0, 375, 700)];
    a.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:a];
    PDTapGestureRecognizer *tapA = [[PDTapGestureRecognizer alloc] init];
    [tapA addTarget:self action:@selector(tapGestureA)];
    [a addGestureRecognizer:tapA];
    
    BView *b = [[BView alloc] initWithFrame:CGRectMake(0, 200, 320, 500)];
    b.backgroundColor = [UIColor greenColor];
    [a addSubview:b];
    PDTapGestureRecognizer *tapB = [[PDTapGestureRecognizer alloc] init];
    [tapB addTarget:self action:@selector(tapGestureB)];
    [b addGestureRecognizer:tapB];
    
    CView *c = [[CView alloc] initWithFrame:CGRectMake(50, 50, 240, 400)];
    c.backgroundColor = [UIColor blueColor];
    [b addSubview:c];
    PDTapGestureRecognizer *tapC = [[PDTapGestureRecognizer alloc] init];
    [tapC addTarget:self action:@selector(tapGestureC)];
    [c addGestureRecognizer:tapC];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = CGRectMake(50, 50, 180, 300);
    [c addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 当UIControl上面添加了手势后，UIControl不会响应自己的action。
//    PDTapGestureRecognizer *tapD = [[PDTapGestureRecognizer alloc] init];
//    [tapD addTarget:self action:@selector(buttonTapGesture)];
//    [button addGestureRecognizer:tapD];
    
}


- (void)tapGestureA{
    NSLog(@"A -taped");

}

- (void)tapGestureB{
    NSLog(@"B -taped");
    
}

- (void)tapGestureC{
    NSLog(@"C -taped");
    
}

- (void)tapGestureD{
    NSLog(@"D -taped");
    
}

- (void)buttonClick {
    NSLog(@"button Clicked");
}

- (void)buttonTapGesture {
    NSLog(@"button taped");
}
@end

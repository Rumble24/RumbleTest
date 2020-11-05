//
//  GestureView.m
//  RumbleTest
//
//  Created by 王景伟 on 2020/11/5.
//

#import "GestureView.h"

@implementation GestureView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
    
    return self;
}

- (void)tap {
    NSLog(@"GestureView  tap");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    NSLog(@"GestureView  touchesBegan");
}

@end

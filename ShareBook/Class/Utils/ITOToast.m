//
//  ITOToast.m
//  LY
//
//  Created by jacktu on 11-10-17.
//  Copyright 2011年 Dotel. All rights reserved.
//

#import "ITOToast.h"

@implementation ITOToast

//文字在水平上的margin
static const int MARGIN_H = 20;

static const int MARGIN_V = 10;

- (id) initWithText : (NSString*) text
{ 
    self = [super init];
    if (self) 
    {
        UIFont* font = FONT(14);
        //计算文字占宽
        CGSize size = [Utils sizeWithString:text andFont:font andBoundeSize:CGSizeMake([Utils getScreenWidth] - MARGIN_H*2, [Utils getScreenHeight] - MARGIN_V*2)];
        
        CGRect rect =  self.frame;
        rect.size.width = size.width + MARGIN_H*2;
        rect.size.height = size.height + MARGIN_V*2;
        self.frame = rect;
        
        self.numberOfLines = 0;
        self.font = font;
        self.text = text;
        self.backgroundColor = [UIColor blackColor];
        [self.layer setCornerRadius:7.0f];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
    }
    
    return self;
}

+ (void) show : (NSString*) text toastType : (Toast_Length) type
{
    [self show:text toastType:type position:CGPointMake(0, 0)];
}

+ (void) show : (NSString*) text toastType : (Toast_Length)type dy:(float)_dy
{
    if ([Utils isEmpty:text]) 
    {
        return;
    }
    
    ITOToast* toast = [[ITOToast alloc] initWithText:text];
    CGRect rect = toast.frame;
    rect.origin.x = ([Utils getScreenWidth] - toast.frame.size.width)/2;
    rect.origin.y = _dy;
    toast.frame = rect;
    
    UIView* rootView = [[UIApplication sharedApplication].delegate window];
    [rootView addSubview:toast];
    [rootView bringSubviewToFront:toast];
    
    //动画效果
    [UIView animateWithDuration:(type - 0.3) 
                          delay:0 
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^(void) {[toast setAlpha:0.3];} 
                     completion:^(BOOL finished) 
     {
         [UIView animateWithDuration:0.3 
                               delay:0 
                             options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear)
                          animations:^(void) {[toast setAlpha:0];} 
                          completion:^(BOOL finished) {[toast removeFromSuperview];}];
     }];
}

+ (void) show : (NSString*) text toastType : (Toast_Length) type position: (CGPoint) point
{
    if ([Utils isEmpty:text]) 
    {
        return;
    }
    
    ITOToast* toast = [[ITOToast alloc] initWithText:text];
    UIView* view = [[UIApplication sharedApplication].delegate window].rootViewController.view;
    CGRect rect = toast.frame;
    if (point.x == 0 && point.y == 0) 
    {
        point = CGPointMake((view.frame.size.width - toast.frame.size.width)/2, view.frame.size.height - 80);
    }
    
    rect.origin.x = point.x;
    rect.origin.y = point.y;
    toast.frame = rect;
    
    UIView* rootView = [[UIApplication sharedApplication].delegate window];
    [rootView addSubview:toast];
    [rootView bringSubviewToFront:toast];
    
    //动画效果
    [UIView animateWithDuration:(type - 0.3) 
                          delay:0 
                        options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveEaseIn)
                     animations:^(void) {[toast setAlpha:0.3];} 
                     completion:^(BOOL finished) 
    {
        [UIView animateWithDuration:0.3 
                              delay:0 
                            options:(UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear)
                         animations:^(void) {[toast setAlpha:0];} 
                         completion:^(BOOL finished) {[toast removeFromSuperview];}];
    }];
}

+ (void) dismiss : (id) sender
{
    ITOLOG(@"dismiss");
    [((UIView*) sender) removeFromSuperview];
}



@end

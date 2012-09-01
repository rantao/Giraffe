//
//  GiraffePaperView.m
//  Giraffe
//
//  Created by Ran Tao on 8.31.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import "GiraffePaperView.h"

@interface GiraffePaperView()
@end

@implementation GiraffePaperView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //UIGraphicsPushContext(context);
    
    //draw the axis
    [[UIColor grayColor] set];
    CGContextSetLineWidth(context, 2.0);
    
    //y-axis
    CGContextMoveToPoint(context, 0.0, self.bounds.origin.y);
    CGContextAddLineToPoint(context, 0.0,self.bounds.origin.y + self.bounds.size.height);
    CGContextStrokePath(context);
    //x-axis
    CGContextMoveToPoint(context, self.bounds.origin.x,0.0);
    CGContextAddLineToPoint(context, self.bounds.origin.x + self.bounds.size.width, 0.0);
    CGContextStrokePath(context);
    
    //draw blue graph lines
    [self drawGraphLinesWithContext:context];
}

- (void)drawAxes:(CGContextRef)context
{
    
}

- (void) drawGraphLinesWithContext:(CGContextRef)context
{
    // make a loop that draw
    [[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.1] set];
//    for (int xInc =self.bounds.origin.x; xInc<self.bounds.size.width; xInc+=20) {
//        CGContextMoveToPoint(context, self.bounds.origin.x +xInc, self.bounds.size.height);
//        CGContextAddLineToPoint(context, self.bounds.origin.x +xInc, 0.0);
//        CGContextStrokePath(context);
//    }
//    for (int yInc =self.bounds.origin.y; yInc<self.bounds.size.height; yInc+=20) {
//        CGContextMoveToPoint(context, 0.0,self.bounds.origin.y+yInc);
//        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.origin.y+yInc);
//        CGContextStrokePath(context);
//    }

    for (float x = ((self.bounds.origin.x)/20)*20; x <= (self.bounds.origin.x + self.bounds.size.width); x += 20) {
        CGContextMoveToPoint(context, x, ((self.bounds.origin.y)/20.0)*20.0);
        CGContextAddLineToPoint(context, x, ((self.bounds.origin.y)/20.0)*20.0 + self.bounds.size.height);
        CGContextStrokePath(context);
    }
    for (float y = ((self.bounds.origin.y)/20)*20; y <= (self.bounds.origin.y + self.bounds.size.height); y += 20) {
        CGContextMoveToPoint(context, ((self.bounds.origin.x)/20.0)*20.0, y);
        CGContextAddLineToPoint(context,((self.bounds.origin.x)/20.0)*20.0 + self.bounds.size.width, y);
        CGContextStrokePath(context);
    }
}
@end

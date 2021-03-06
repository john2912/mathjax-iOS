//
//  Vec2.m
//  eBook
//
//  Created by Dan Lynch on 4/12/11.
//  Copyright 2011 Pyramation Media. All rights reserved.
//

#import "Vec2.h"


@implementation Vec2
@synthesize a, b;

- (id)initWithPointsA:(CGPoint)aa B:(CGPoint)bb {
    
    self.a = aa;
    self.b = bb;
    return self;
}

- (void) draw : (CGContextRef) context {

    [self drawVector:context];
    [self drawArrow:context];

}

- (void) drawVector : (CGContextRef) context {
    CGContextSetLineWidth(context, 2);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, b.x, b.y);  
    CGContextStrokePath(context);
}

- (void) drawArrow : (CGContextRef) context {
    
    // draw arrow http://stackoverflow.com/questions/2500197/drawing-triangle-arrow-on-a-line-with-cgcontext
    CGFloat r, ax, ay, bx, by, cx, cy, dy, dx;
    
    // length and width are 
    CGFloat length, width;
    width = 10;
    length = 10; 
    
    r = atan2( b.y - a.y , b.x - a.x );
    r += M_PI;
    bx = b.x;
    by = b.y;
    dx = bx + cos( r ) * length;
    dy = by + sin( r ) * length;
    r += M_PI_2; // perpendicular to path
    ax = dx + cos( r ) * width;
    ay = dy + sin( r ) * width;
    cx = dx - cos( r ) * width;
    cy = dy - sin( r ) * width;
    
    CGContextSetLineWidth(context, 3);    
    CGContextBeginPath(context);
    CGContextMoveToPoint( context , ax , ay );
    CGContextAddLineToPoint( context , bx , by );
    CGContextAddLineToPoint( context , cx , cy );
    CGContextFillPath(context);

    
}

- (void) drawComponents:(CGContextRef)context {
    CGContextSetLineWidth(context, 2);

    CGContextBeginPath(context);
    CGContextMoveToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, b.x, a.y);    
    
    CGContextMoveToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, a.x, a.y);
    CGContextAddLineToPoint(context, a.x, b.y);    
    CGContextStrokePath(context);

}

- (void) drawTrigComponents:(CGContextRef)context {

    CGContextSetLineWidth(context, 2);
    
    
    // http://mitat.tuu.fi/?p=34

    float dash[2]={6 ,5}; // pattern 6 times “solid”, 5 times “empty”
    CGContextSetLineDash(context,0,dash,2);

    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, a.x, b.y);
    CGContextAddLineToPoint(context, a.x, b.y);
    CGContextAddLineToPoint(context, b.x, b.y);    
    
    CGContextMoveToPoint(context, b.x, a.y);
    CGContextAddLineToPoint(context, b.x, a.y);
    CGContextAddLineToPoint(context, b.x, b.y);    
    CGContextStrokePath(context);
 
    
    float normal[1]={1};
    CGContextSetLineDash(context,0,normal,0);
    

    
}




- (void) drawDot:(CGContextRef) context {
    
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextFillEllipseInRect(context, CGRectMake(b.x-5, b.y-5, 10,10));    
}

- (float) angle {
    return atan2( b.y - a.y , b.x - a.x );
}

@end

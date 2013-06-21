//
//  VWWCGLifeView.m
//  YAGOLAM
//
//  Created by Zakk Hoyt on 6/20/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//
#import "VWWCGLifeView.h"
#import "VWWGOLLife.h"



@implementation VWWCGLifeView

//- (id)initWithFrame:(NSRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code here.
//    }
//    
//    return self;
//}
//
//- (void)drawRect:(NSRect)dirtyRect
//{
//    // Drawing code here.
//}
//




- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(NSRect)rect
{
    //    NSLog(@"%s", __func__);
    
    //    self.backgroundColor = [UIColor clearColor];
    
    CGFloat cellWidth = self.bounds.size.width / self.life.width;
    CGFloat cellHeight = self.bounds.size.height / self.life.height;
    
    CGFloat red, green, blue, alpha;
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];

    //    for(NSInteger x = 0; x < self.physics.width; x++){
    //        for(NSInteger y = 0; y < self.physics.height; y++){
    //            VWWGOLCell *cell = [self.physics cellAtIndex:y + self.physics.width * x];
    //            if(cell){
    //                [cell.color getRed:&red green:&green blue:&blue alpha:&alpha];
    //                CGContextSetRGBFillColor(context, red, green, blue, alpha);
    //            }
    //            else{
    //                CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    //            }
    //
    //            CGFloat rectX = cellWidth * x;
    //            CGFloat rectY = cellHeight * y;
    //
    //            CGRect cellRect = CGRectMake(rectX, rectY, cellWidth, cellHeight);
    ////            CGContextFillEllipseInRect(context, cellRect);
    //            CGContextFillRect(context, cellRect);
    //        }
    //    }
    
    
    for(VWWGOLCell *cell in [self.life.cells allValues]){
        [cell.color getRed:&red green:&green blue:&blue alpha:&alpha];
        CGContextSetRGBFillColor(context, red, green, blue, alpha);
        CGFloat rectX = cellWidth * cell.x;
        CGFloat rectY = cellHeight * cell.y;
        CGRect cellRect = CGRectMake(rectX, rectY, cellWidth, cellHeight);
        CGContextFillRect(context, cellRect);
    }
    
    
    
    
    CGContextDrawPath(context,kCGPathStroke);
    
}


-(void)mouseEvent:(NSEvent *)theEvent{
//    NSArray *touchesArray = [touches allObjects];
//    UITouch* touch = touchesArray[0];
    
    NSPoint mousePos = [theEvent locationInWindow];
    
    
    //CGPoint begin = [touch locationInView:self];
    
    
    
    CGFloat cellWidth = self.bounds.size.width / self.life.width;
    CGFloat cellHeight = self.bounds.size.height / self.life.height;
    
    NSInteger x = mousePos.x / cellWidth;
    NSInteger y = mousePos.y / cellHeight;
    
    [self.delegate cgLifeView:self userTouchedAtX:x andY:y];
    
}

-(void)mouseMoved:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

- (void)mouseDown:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

-(void)mouseUp:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

    






@end

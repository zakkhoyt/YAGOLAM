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

    CGContextSetRGBFillColor(context, 0, 0, 0, 1.0);
    CGContextFillRect(context, self.bounds);
    
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
    
    NSPoint mousePos = [theEvent locationInWindow];
    
    CGFloat cellWidth = self.bounds.size.width / self.life.width;
    CGFloat cellHeight = self.bounds.size.height / self.life.height;
    
    NSInteger x = mousePos.x / cellWidth;
    NSInteger y = mousePos.y / cellHeight;
//    NSLog(@"mousePos.x/y %f/%f self.life.width/height %ld/%ld", mousePos.x, mousePos.y, self.life.width, self.life.height);
    
    
    
    [self.delegate cgLifeView:self userTouchedAtX:x andY:y];
    
}

-(void)mouseMoved:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

-(void)mouseUp:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}

    






@end

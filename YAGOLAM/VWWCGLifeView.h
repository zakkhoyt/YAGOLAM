//
//  VWWCGLifeView.h
//  YAGOLAM
//
//  Created by Zakk Hoyt on 6/20/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class VWWGOLLife;
@class VWWCGLifeView;


@protocol VWWCGLifeViewDelegate <NSObject>
-(void)cgLifeView:(VWWCGLifeView*)sender userTouchedAtX:(NSInteger)x andY:(NSInteger)y;
@end

@interface VWWCGLifeView : NSView
@property (nonatomic, weak) id <VWWCGLifeViewDelegate> delegate;
@property (nonatomic, strong) VWWGOLLife *life;
@end

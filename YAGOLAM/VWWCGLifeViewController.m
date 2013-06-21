//
//  VWWCGLifeViewController.m
//  YAGOLAM
//
//  Created by Zakk Hoyt on 6/20/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import "VWWCGLifeViewController.h"
#import "VWWCGLifeView.h"
#import "VWWGOLLife.h"

static NSInteger kGOLWidth = 200;
static NSInteger kGOLHeight = 200;
static float kInitialFrequency = 0.1;


@interface VWWCGLifeViewController () <VWWGOLLifeDelegate, VWWCGLifeViewDelegate>
@property (nonatomic, strong) VWWGOLLife *life;
@property (strong) IBOutlet VWWCGLifeView *cgLifeView;
@property (strong) IBOutlet NSButton *startButton;
@property (strong) IBOutlet NSButton *generateButton;
@property (strong) IBOutlet NSSlider *frequencySlider;
@property (nonatomic) float generateFrequency;
@end

@implementation VWWCGLifeViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//- (void)viewDidLoad
-(void)loadView
{
    [super loadView];
    self.cgLifeView.delegate = self;
    self.life = [[VWWGOLLife alloc]initWithWidth:kGOLWidth height:kGOLHeight];
    self.life.delegate = self;
    self.generateFrequency = kInitialFrequency;
//    self.frequencySlider.value = self.generateFrequency;
    self.startButton.hidden = YES;
}





#pragma mark IBActions

- (IBAction)startButtonTouchAction:(id)sender {
    if(self.life.running == NO){
        [self.life start];

        [self.startButton  setTitle:@"Pause"];
        //        self.generateButton.hidden = YES;
    }
    else{
        [self.life stop];
        [self.startButton  setTitle:@"Evolve!"];
        //        self.generateButton.hidden = NO;
    }
}

- (IBAction)generateButtonAction:(id)sender {
    //    [self.life killAllCells];
    
    NSInteger t = self.life.width * self.life.height;
    NSInteger requiredCellCount = t * self.generateFrequency;
    
    while(self.life.cells.count < requiredCellCount){
        // generate a cell at random and insert it
        //        NSInteger index = random()%t;
        NSInteger index = arc4random()%t;
        NSInteger y = index / self.life.width;
        NSInteger x = index - self.life.width * y;
        VWWGOLCell *newCell = [[VWWGOLCell alloc]initWithPositionX:x andY:y alive:YES];
        [self.life addCell:newCell];
    }
    
    [self renderCells];
    self.startButton.hidden = NO;
    NSLog(@"added %ld cells. Actual count:%ld", requiredCellCount, self.life.cells.count);
}



//- (IBAction)frequencySliderValueChanged:(UISlider*)sender {
//    self.generateFrequency = sender.value;
//    //    NSLog(@"changed generate frequency to %f", self.generateFrequency);
//}

//- (IBAction)oneGenerationButtonTouchUpInside:(id)sender {
//    [self.life processTimer];
//}


- (IBAction)clearButtonAction:(id)sender {
    [self.life killAllCells];
    [self renderCells];

}




#pragma mark Implements VWWGOLLifeDelegate
-(void)renderCells{
    
    self.cgLifeView.life = self.life;
    [self.cgLifeView setNeedsDisplay:YES];
    
    //    if(self.life.cells.count == 0){
    //        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"DEAD!" message:@"All cells died. Lame." delegate:nil cancelButtonTitle:@"alright" otherButtonTitles:nil, nil];
    //        [alert show];
    //        [self startButtonTouchUpInside:nil];
    //        self.startButton.hidden = YES;
    //    }
}



#pragma mark Implements VWWCGLifeViewDelegate
-(void)cgLifeView:(VWWCGLifeView*)sender userTouchedAtX:(NSInteger)x andY:(NSInteger)y{
    VWWGOLCell *cell = [[VWWGOLCell alloc]initWithPositionX:x andY:y alive:YES];
    [self.life addCell:cell];
    [self renderCells];
}


@end

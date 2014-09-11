//
//  DTGraphView.m
//  AQIGraph
//
//  Created by IOSUSER006 on 8/29/14.
//  Copyright (c) 2014 Dev-Touch. All rights reserved.
//

#import "DTGraphView.h"



@implementation DTGraphView

@synthesize graphPlot = _graphPlot;
@synthesize graphMini = _graphMini;
@synthesize arrayPoints = _arrayPoints;
@synthesize arrayXTitle = _arrayXTitle;


- (DTGraphPlot *)graphPlot
{
    if (!_graphPlot) {
        _graphPlot = [[DTGraphPlot alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width-20, self.frame.size.height-20)];
    }
    return _graphPlot;
}



- (NSMutableArray *)arrayPoints
{
    if (!_arrayPoints) {
        _arrayPoints = @[@"1.300000",@"1.330000",@"3.004000",@"3.500000",@"4.200000",@"3.000000",@"1.000000",].mutableCopy;
    }
    return _arrayPoints;
}

- (NSMutableArray *)arrayXTitle
{
    if (!_arrayXTitle) {
        _arrayXTitle = @[@"1990",
                         @"1992",
                         @"1994",
                         @"1996",
                         @"1998",
                         @"2000",
                         @"2002",].mutableCopy;
    }
    return _arrayXTitle;
}


#pragma mark - Method

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        arrayXLabel = @[].mutableCopy;
        arrayYLabel = @[].mutableCopy;
        arrayYTitle = @[].mutableCopy;
        
        
        
        self.graphPlot.layer.borderColor = [UIColor blackColor].CGColor;
        //plotGraph.layer.cornerRadius = 8;
        [self.graphPlot setBackgroundColor:[UIColor whiteColor]];
        
        self.graphPlot.layer.borderWidth = 2;
        [self.graphPlot.arrayPoints addObjectsFromArray:self.arrayPoints];
        
        [self addSubview:self.graphPlot];
        
    
    }
    return self;
}
- (void)setTotalContents:(int)content
{
    totalContent = content;
    [self.graphPlot setTotalContents:totalContent];
    [self.graphPlot changeSetUp];
    [arrayYTitle removeAllObjects];
    [arrayYTitle addObjectsFromArray:[GraphSetting getDisplayPointsUsingMax:[GraphSetting getMaxValue:self.arrayPoints] usingMin:[GraphSetting getMinValue:self.arrayPoints] withTotalYContent:totalContent]];
    [self setUpXAxis];
    [self setUpYAxis];
}

#pragma mark Sub Functions
- (void)setUpXAxis{
    for (UILabel *lbl in arrayXLabel) {
        [lbl removeFromSuperview];
    }
    [arrayXLabel removeAllObjects];
    
    
    float xLocation = CGRectGetMinX(self.graphPlot.frame) + ((CGRectGetWidth(self.graphPlot.frame)/[self.arrayXTitle count])/2);
    for (int count = [self.arrayXTitle count]-1; count >=0; count--) {
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(xLocation, CGRectGetMaxY(self.graphPlot.frame), CGRectGetWidth(self.graphPlot.frame)/([self.arrayXTitle count]+1), 20)];
        [lbl setText:[self.arrayXTitle objectAtIndex:count]];
        [lbl setTag:[self.arrayXTitle count]-count];
        [lbl setNumberOfLines:0];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [lbl setTextColor:[UIColor blueColor]];
        //[lbl setText:[NSString stringWithFormat:@"%.3f",[[arrPoints objectAtIndex:count]floatValue]]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [lbl setTextColor:[UIColor blueColor]];
        
        [lbl setFont:[UIFont systemFontOfSize:10]];
        
        if (totalContent == 3) {
            [lbl setFont:[UIFont systemFontOfSize:6]];
            
        }
        [lbl setAdjustsFontSizeToFitWidth:YES];
        [arrayXLabel addObject:lbl];
        [self addSubview:lbl];
        xLocation = xLocation + CGRectGetWidth(lbl.frame);
    }
}
- (void)setUpYAxis{
    for (UILabel *lbl in arrayYLabel) {
        [lbl removeFromSuperview];
    }
    [arrayYLabel removeAllObjects];
    
    float yLocation = CGRectGetMinY(self.graphPlot.frame);
    for (int count = [arrayYTitle count]-1; count >=0; count--) {
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, yLocation, 18, self.graphPlot.frame.size.height/totalContent)];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [lbl setText:[NSString stringWithFormat:@"%.2f",[[arrayYTitle objectAtIndex:count]floatValue]]];
        [lbl setTextAlignment:NSTextAlignmentRight];
        [lbl setTextColor:[UIColor blueColor]];
        [lbl setFont:[UIFont systemFontOfSize:8]];
        [arrayYLabel addObject:lbl];
        [self addSubview:lbl];
        yLocation = yLocation + CGRectGetHeight(lbl.frame);
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

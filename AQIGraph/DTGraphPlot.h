//
//  DTGraphPlot.h
//  AQIGraph
//
//  Created by IOSUSER006 on 8/29/14.
//  Copyright (c) 2014 Dev-Touch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphSetting.h"


@protocol DTGraphPlotDelegate;

@interface DTGraphPlot : UIView{
    
    UIBezierPath *path;
    float xPoint;
    float adder;
    float xLine;
    int index;
    BOOL LineYES;
    int totalContents;
    
}

@property (strong, nonatomic) NSMutableArray *arrayPoints;

@property (weak) id <DTGraphPlotDelegate>delegate;
- (void)setTotalContents: (int)content;
- (void)changeSetUp;


@end

@protocol DTGraphPlotDelegate <NSObject>

@optional
- (void)selectedPoint :(int)selected;

@end
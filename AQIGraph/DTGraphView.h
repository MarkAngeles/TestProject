//
//  DTGraphView.h
//  AQIGraph
//
//  Created by IOSUSER006 on 8/29/14.
//  Copyright (c) 2014 Dev-Touch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DTGraphPlot.h"
@interface DTGraphView : UIView<DTGraphPlotDelegate>{
    int totalContent;
    NSMutableArray *arrayXLabel;
    NSMutableArray *arrayYLabel;
    NSMutableArray *arrayYTitle;
}

@property (strong, nonatomic) DTGraphPlot *graphPlot;
@property (strong, nonatomic) DTGraphPlot *graphMini;
@property (strong, nonatomic) NSMutableArray *arrayPoints;
@property (strong, nonatomic) NSMutableArray *arrayXTitle;

- (void)setTotalContents: (int)content;

@end

//
//  DTGraphPlot.m
//  AQIGraph
//
//  Created by IOSUSER006 on 8/29/14.
//  Copyright (c) 2014 Dev-Touch. All rights reserved.
//

#import "DTGraphPlot.h"


@interface DTGraphPlot (){
    
    NSMutableArray *arrayPlots;
    NSMutableArray *arrayIndicator;
}

@end

@implementation DTGraphPlot
@synthesize arrayPoints = _arrayPoints;
@synthesize delegate;




- (NSMutableArray *)arrayPoints
{
    if (!_arrayPoints) {
        _arrayPoints = @[].mutableCopy;
    }
    return _arrayPoints;
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        arrayPlots = @[].mutableCopy;
        arrayIndicator = @[].mutableCopy;
    
    }
    return self;
}




#pragma SetUp
- (void)changeSetUp{
    [arrayPlots removeAllObjects];
    NSLog(@"array = %@",self.arrayPoints);
    adder = (self.frame.size.width)/([self.arrayPoints count]+1);
    xPoint = adder;
    
    for (int count  = 0; count < [self.arrayPoints count]; count++) {
        [self points:count];
    }
    [self setNeedsDisplay];
}
- (void)setTotalContents:(int)content
{
    totalContents = content;
}

- (void)points: (int)count{
    float multiplier = 0;
    float _frame = self.frame.size.height-(self.frame.size.height/totalContents);
    multiplier = [GraphSetting getEquivalentOfOne:_frame to:[GraphSetting getMaxYValue:self.arrayPoints]];
    [arrayPlots addObject:[NSString stringWithFormat:@"%f",_frame-[GraphSetting getEquivalentY:[[self.arrayPoints objectAtIndex:count]floatValue] using:multiplier withMin:[GraphSetting getMinValue:self.arrayPoints]]]];
}
- (void)drawRect:(CGRect)rect{
    // Create an oval shape to draw.
    NSLog(@"total Contents = %d",totalContents);
    
    float _pointAdder = (self.frame.size.height/totalContents)/2;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    
    [aPath moveToPoint:CGPointMake(2, self.frame.size.height)];
    for (int count = 0; count < [arrayPlots count]; count++) {
        [aPath addLineToPoint:CGPointMake(xPoint, [[arrayPlots objectAtIndex:count]floatValue]+_pointAdder)];
        xPoint = xPoint+adder;
    }
    [aPath addLineToPoint:CGPointMake(xPoint, [[arrayPlots lastObject]floatValue]+_pointAdder)];
    [aPath addLineToPoint:CGPointMake(xPoint, self.frame.size.height)];
    [aPath addLineToPoint:CGPointMake(2, self.frame.size.height)];
    [aPath setLineWidth:2];
    [aPath closePath];
    [[UIColor blackColor] setStroke];
    UIColor *color = [[UIColor alloc] initWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
    [color setFill];
    [aPath stroke];
    [aPath fill];
    
    xPoint = adder;
    for (int count = 0; count < [arrayPlots count]; count++) {
        
        UIBezierPath *circle;
        circle =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(xPoint-4, [[arrayPlots objectAtIndex:count]floatValue]-4+_pointAdder, 8, 8)];
        [[UIColor blueColor]setFill];
        if (LineYES && index == count) {
            [[UIColor redColor]setFill];
        }
        [circle fill];
        xPoint = xPoint+adder;
    }
    for (UILabel *lbl in arrayIndicator) {
        [lbl removeFromSuperview];
    }
    if (LineYES) {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint:CGPointMake(xLine, self.frame.size.height)];
        [linePath addLineToPoint:CGPointMake(xLine, 0)];
        [linePath setLineWidth:1];
        [[UIColor redColor] setStroke];
        [linePath stroke];
        UIBezierPath *linePath1 = [UIBezierPath bezierPath];
        [linePath1 moveToPoint:CGPointMake(0, [[arrayPlots objectAtIndex:index]floatValue]+_pointAdder)];
        [linePath1 addLineToPoint:CGPointMake(xLine, [[arrayPlots objectAtIndex:index]floatValue]+_pointAdder)];
        //[linePath1 addLineToPoint:CGPointMake(xLine, 0)];
        [linePath1 setLineWidth:1];
        [[UIColor redColor] setStroke];
        [linePath1 stroke];
        
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(xLine-25, [[arrayPlots objectAtIndex:index]floatValue], 50, 20)];
        [lbl setBackgroundColor:[UIColor clearColor]];
        [lbl setTextAlignment:NSTextAlignmentCenter];
        [lbl setFont:[UIFont systemFontOfSize:10]];
        [lbl setText:[NSString stringWithFormat:@"%.3f",[[self.arrayPoints objectAtIndex:index] floatValue]]];
        [arrayIndicator addObject:lbl];
        [self addSubview:lbl];
        
    }
    
}
#pragma mark Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // NSLog(@"touches");
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    LineYES = YES;
    NSLog(@"point x = %@ %@",[NSString stringWithFormat:@"%f",[GraphSetting getEquivalentYLine:point.x using:self.frame.size.width/[self.arrayPoints count] withPoints:self.arrayPoints]], self.arrayPoints);
    index = [GraphSetting getIndexOfPoint:point.x using:self.frame.size.width/[self.arrayPoints count] withArray:self.arrayPoints];
    xLine = index*((self.frame.size.width)/([self.arrayPoints count]+1)) + ((self.frame.size.width)/([self.arrayPoints count]+1));
    xPoint = adder;
    
//    [delegate selectedPoint:index];
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    LineYES = YES;
    index = [GraphSetting getIndexOfPoint:point.x using:self.frame.size.width/[self.arrayPoints count] withArray:self.arrayPoints];
    xLine = index*((self.frame.size.width)/([self.arrayPoints count]+1)) + ((self.frame.size.width)/([self.arrayPoints count]+1));
    xPoint = adder;
//    [delegate selectedPoint:index];
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    LineYES = NO;
    xPoint = adder;
//    [delegate selectedPoint:-1];
    [self setNeedsDisplay];
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

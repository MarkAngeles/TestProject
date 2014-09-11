//
//  GraphSetting.m
//  Graph
//
//  Created by DT_Macmini_Mark Angeles on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GraphSetting.h"

@implementation GraphSetting

+ (CGFloat)getMaxValue :(NSMutableArray *)points{
    CGFloat _floatReturn = 0.00;
    for (int count = 0; count < [points count]; count++) {
        if ([[points objectAtIndex:count]floatValue] > _floatReturn) {
            _floatReturn = [[points objectAtIndex:count]floatValue];
        }
    }
    return _floatReturn;
}
+ (CGFloat)getMinValue :(NSMutableArray *)points{
    CGFloat _floatReturn = 99999.00;
    for (int count = 0; count < [points count]; count++) {
        if ([[points objectAtIndex:count]floatValue] < _floatReturn) {
            _floatReturn = [[points objectAtIndex:count]floatValue];
        }
    }
    return _floatReturn;
}
+ (CGFloat)getMaxYValue :(NSMutableArray*)points{
    CGFloat _floatReturn = 0;
    CGFloat Min = 9999999.00;
    CGFloat Max = 0;
    for (int count = 0; count < [points count]; count++) {
        if ([[points objectAtIndex:count]floatValue] < Min) {
            Min = [[points objectAtIndex:count]floatValue];
        }
    }
    for (int count = 0; count < [points count]; count++) {
        if ([[points objectAtIndex:count]floatValue] > Max) {
            Max = [[points objectAtIndex:count]floatValue];
        }
    }
    _floatReturn = Max-Min;
    return _floatReturn;
}
+ (CGFloat)getEquivalentOfOne :(CGFloat)actual to :(CGFloat)_new{
    CGFloat _floatReturn = 0;
    _floatReturn = _new/actual;
    return  _floatReturn;
}
+ (CGFloat)getEquivalentY :(CGFloat)point using :(CGFloat)_point withMin :(CGFloat)min{
    CGFloat _floatReturn = 0;
    for (float count = min; point > count; count = count + _point) {
        _floatReturn = _floatReturn + 1;
    }
    
    return  _floatReturn;
}
+ (CGFloat)getEquivalentYLine :(CGFloat)point using :(CGFloat)_point withPoints :(NSMutableArray*)array{
    int index = point/_point;
    NSLog(@"point == %f",point);
    NSLog(@"_point == %f",_point);
    if (index >= [array count]) {
        index = [array count]-1;
    }
    NSLog(@"index == %d",index);
    return  [[array objectAtIndex:index]floatValue];
}
+ (NSMutableArray*)getDisplayPointsUsingMax :(CGFloat)max usingMin :(CGFloat)min withTotalYContent:(NSInteger)total{
    CGFloat _add = (max - min)/(total-1);
    CGFloat _point = min;
    NSMutableArray *_arrayRetunrn = [NSMutableArray array];
    for (int count = 0; count < total; count++) {
        [_arrayRetunrn addObject:[NSString stringWithFormat:@"%f",_point]];
        _point = _point + _add;
    }
    
    return _arrayRetunrn;
}
+ (NSMutableArray*)getConvertedValueOf :(NSMutableArray *)convert to :(NSMutableArray*)intended{
    NSMutableArray *_arrayReturn = [NSMutableArray array];
    for (int count = 0; count < [convert count]; count++) {
        float _converted = 0;
        //conversion: PH = US/PH
        _converted = [[convert objectAtIndex:count]floatValue]/ [[intended objectAtIndex:count]floatValue];
        [_arrayReturn addObject:[NSString stringWithFormat:@"%f",_converted]];
    }
    return _arrayReturn;
}
+ (NSMutableArray*)getLabelPointsOf :(NSString*)xAxis{
     NSMutableArray *_arrayReturn = [NSMutableArray array];
    if ([xAxis isEqualToString:@"daily"]) {
        [_arrayReturn addObject:@"Monday"];
        [_arrayReturn addObject:@"Tuesday"];
        [_arrayReturn addObject:@"Wednesday"];
        [_arrayReturn addObject:@"Thursday"];
        [_arrayReturn addObject:@"Friday"];
    }else if ([xAxis isEqualToString:@"weekly"]){
        [_arrayReturn addObject:@"Week 1"];
        [_arrayReturn addObject:@"Week 2"];
        [_arrayReturn addObject:@"Week 3"];
        [_arrayReturn addObject:@"Week 4"];
    }else if ([xAxis isEqualToString:@"monthly"]){
        
        [_arrayReturn addObject:@"Month 1"];
        [_arrayReturn addObject:@"Month 2"];
        [_arrayReturn addObject:@"Month 3"];
    }else if ([xAxis isEqualToString:@"yearly"]){
        [_arrayReturn addObject:@"JAN\n2012"];
        [_arrayReturn addObject:@"FEB\n2012"];
        [_arrayReturn addObject:@"MAR\n2012"];
        [_arrayReturn addObject:@"APR\n2012"];
        [_arrayReturn addObject:@"MAY\n2012"];
        [_arrayReturn addObject:@"JUN\n2012"];
        [_arrayReturn addObject:@"JUL\n2012"];
//        [_arrayReturn addObject:@"AUG\n2012"];
//        [_arrayReturn addObject:@"SEP\n2012"];
//        [_arrayReturn addObject:@"OCT\n2012"];
//        [_arrayReturn addObject:@"NOV\n2012"];
//        [_arrayReturn addObject:@"DEC\n2012"];
    }
    return _arrayReturn;
}

+ (NSInteger)getIndexOfPoint:(CGFloat)point using:(CGFloat)_points withArray:(NSMutableArray *)array
{
    
    int index = point/_points;
    if (index >= [array count]) {
        index = [array count]-1;
    }
    
    return  index;
    
}

@end

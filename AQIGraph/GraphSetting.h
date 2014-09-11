//
//  GraphSetting.h
//  Graph
//
//  Created by DT_Macmini_Mark Angeles on 10/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface GraphSetting : NSObject
+ (CGFloat)getMinValue :(NSMutableArray *)points;
+ (CGFloat)getMaxValue :(NSMutableArray *)points;
+ (CGFloat)getMaxYValue :(NSMutableArray*)points;
+ (CGFloat)getEquivalentOfOne :(CGFloat)actual to :(CGFloat)_new;
+ (CGFloat)getEquivalentY :(CGFloat)point using :(CGFloat)_point withMin :(CGFloat)min;
+ (CGFloat)getEquivalentYLine :(CGFloat)point using :(CGFloat)_point withPoints :(NSMutableArray*)array;
+ (NSMutableArray*)getDisplayPointsUsingMax :(CGFloat)max usingMin :(CGFloat)min withTotalYContent: (NSInteger)total;
+ (NSMutableArray*)getConvertedValueOf :(NSMutableArray *)convert to :(NSMutableArray*)intended;
+ (NSMutableArray*)getLabelPointsOf :(NSString*)xAxis;
+ (NSInteger)getIndexOfPoint: (CGFloat)point using: (CGFloat)_points withArray: (NSMutableArray *)array;

@end

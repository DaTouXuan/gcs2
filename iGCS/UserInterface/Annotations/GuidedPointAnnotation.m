//
//  GotoPointAnnotation.m
//  iGCS
//
//  Created by Claudio Natoli on 6/04/12.
//

#import "GuidedPointAnnotation.h"
#import "WaypointAnnotation.h"

@implementation GuidedPointAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    return [super initWithCoordinate:coordinate
                               title:@"Flying to"
                              viewID:@"GUIDED"
                               color:[[GCSThemeManager sharedInstance] waypointNavColor]
                        andAnimation:YES];
}

@end

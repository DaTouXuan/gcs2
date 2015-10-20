//
//  GotoPointAnnotation.h
//  iGCS
//
//  Created by Claudio Natoli on 6/04/12.
//

#import "CustomPointAnnotation.h"

@interface GuidedPointAnnotation :  CustomPointAnnotation

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate NS_DESIGNATED_INITIALIZER;

@end

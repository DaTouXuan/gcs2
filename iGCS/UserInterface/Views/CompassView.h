//
//  CompassView.h
//  iGCS
//
//  Created by Claudio Natoli on 12/02/12.
//

#import <UIKit/UIKit.h>
#import "DoubleBufferedAsyncView.h"

@interface CompassView : DoubleBufferedAsyncView

- (void) drawToContext:(CGContextRef)ctx rect:(CGRect)rect;

- (void) setHeading:(float)heading;
- (void) setNavBearing:(float)navBearing;

@end

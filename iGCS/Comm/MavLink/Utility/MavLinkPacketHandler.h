//
//  MavLinkPacketHandler.h
//  iGCS
//
//  Created by Claudio Natoli on 8/02/12.
//

#import <Foundation/Foundation.h>
#define MAVLINK_SEPARATE_HELPERS
#import "MavLinkTools.h"

@protocol MavLinkPacketHandler <NSObject>
@required
- (void) handlePacket:(mavlink_message_t*)msg;
@end

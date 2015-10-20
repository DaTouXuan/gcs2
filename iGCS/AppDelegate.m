//
//  AppDelegate.m
//  iGCS
//
//  Created by Claudio Natoli on 5/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "DDFileLogger.h"
#import "DDTTYLogger.h"
#import "CommController.h"
#import "GCSSpeechManager.h"

@implementation AppDelegate

static AppDelegate *shared;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if DEBUG
    DDFileLogger* fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency = 60 * 60 * 1; // 1 hour
    fileLogger.logFileManager.maximumNumberOfLogFiles = 5;
    [DDLog addLogger:fileLogger];
#endif
    [DDLog addLogger:[DDTTYLogger sharedInstance]];

    shared = self;

    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window.tintColor = [[GCSThemeManager sharedInstance] appTintColor];

    // call on startup to setup NSNotifcation observers
    [GCSSpeechManager sharedInstance];

    DDLogInfo(@"Application finished launching.");

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    if (alertView.visible) {
		[alertView dismissWithClickedButtonIndex:0 animated:YES];
	}
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	[updateTimer invalidate]; // shutdown the timer;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	NSLog(@"Entering Foreground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    [[CommController sharedInstance] startTelemetryMode];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[CommController sharedInstance] closeAllInterfaces];
    
    if (alertView.visible) {
		[alertView dismissWithClickedButtonIndex:0 animated:YES];
	}
}

+(AppDelegate*)sharedDelegate {
    return shared;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return NO;
}

@end

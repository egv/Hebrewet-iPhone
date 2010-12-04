//
//  HebrewetAppDelegate.m
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HebrewetAppDelegate.h"

#import "HebrewetViewController.h"

@implementation HebrewetAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
     
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end

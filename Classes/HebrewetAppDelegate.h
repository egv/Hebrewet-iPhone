//
//  HebrewetAppDelegate.h
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HebrewetViewController;

@interface HebrewetAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    HebrewetViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HebrewetViewController *viewController;

@end

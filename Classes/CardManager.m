//
//  CardManager.m
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CardManager.h"
#import "SBJsonParser.h"

@implementation CardManager

@synthesize cards;

+ (CardManager*)sharedManager {
    static CardManager *INSTANCE;
    
    if (!INSTANCE) {
        INSTANCE = [[CardManager alloc] init];
    }
    
    return INSTANCE;
}

#pragma mark -
#pragma mark accessors

- (NSArray*)cards {
    if (!cards) {
        NSError *error = nil;

        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"cards" ofType:@"json"];
        NSString *cardsFile = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        
        if (!error) {
            SBJsonParser *json = [[SBJsonParser alloc] init];
            self.cards = [json objectWithString:cardsFile error:&error];
            [json release];
            
            if (error) {
                NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
            }
        } else {
            NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
        }
    }
    
    return cards;
}

#pragma mark -
#pragma mark memory management

- (void)dealloc {
    [cards release];
    
    [super dealloc];
}

@end

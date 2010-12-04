//
//  CardManager.h
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CardManager : NSObject {
    NSArray *cards;
}

@property (nonatomic, retain) NSArray *cards;

+ (CardManager*)sharedManager;



@end

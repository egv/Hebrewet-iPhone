//
//  HebrewetViewController.h
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HebrewetViewController : UIViewController {
    UIView *frontView;
    UIView *backView;
    
    UILabel *frontLabel;
    UILabel *backLabel;
    
    NSDictionary *currentCard;
}

@property (nonatomic, retain) IBOutlet UIView *frontView;
@property (nonatomic, retain) IBOutlet UIView *backView;

@property (nonatomic, retain) IBOutlet UILabel *frontLabel;
@property (nonatomic, retain) IBOutlet UILabel *backLabel;

@property (nonatomic, retain) NSDictionary *currentCard;


@end

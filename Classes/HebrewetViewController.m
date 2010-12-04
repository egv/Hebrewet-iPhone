//
//  HebrewetViewController.m
//  Hebrewet
//
//  Created by Gennady Evstratov on 12/5/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CardManager.h"
#import "HebrewetViewController.h"

@interface HebrewetViewController ()

- (void)frontViewTapped:(UIGestureRecognizer*)recognizer;
- (void)backViewTapped:(UIGestureRecognizer*)recognizer;

@end

@implementation HebrewetViewController

@synthesize frontView;
@synthesize backView;
@synthesize frontLabel;
@synthesize backLabel;

@synthesize currentCard;

#pragma mark -
#pragma mark private actions

- (void)frontViewTapped:(UIGestureRecognizer *)recognizer {
    self.backLabel.text = [currentCard objectForKey:@"back"];
    
    [UIView beginAnimations:@"sides flip" context:NULL];
    
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
    
    [self.frontView removeFromSuperview];
    [self.view addSubview:self.backView];
    
    [UIView commitAnimations];
}

- (void)backViewTapped:(UIGestureRecognizer *)recognizer {
    self.currentCard = [[CardManager sharedManager] nextCard];
    
    self.frontLabel.text = [self.currentCard objectForKey:@"front"];
    
    [UIView beginAnimations:@"sides flip" context:NULL];
    
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    
    [self.backView removeFromSuperview];
    [self.view addSubview:self.frontView];
    
    [UIView commitAnimations];    
}

#pragma mark -
#pragma mark view setup

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    UITapGestureRecognizer *frontTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(frontViewTapped:)];
    frontTapRecognizer.numberOfTapsRequired = 1;
    frontTapRecognizer.numberOfTouchesRequired =1;
    [self.frontView addGestureRecognizer:frontTapRecognizer];
    [frontTapRecognizer release];

    UITapGestureRecognizer *backTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backViewTapped:)];
    backTapRecognizer.numberOfTapsRequired = 1;
    backTapRecognizer.numberOfTouchesRequired =1;
    [self.backView addGestureRecognizer:backTapRecognizer];
    [backTapRecognizer release];
    
    // set up first view
    
    self.currentCard = [[CardManager sharedManager] nextCard];
    self.frontLabel.text = [self.currentCard objectForKey:@"front"];

    [self.view addSubview:self.frontView];
}


#pragma mark -
#pragma mark memoty management

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [currentCard release];
    
    [frontView release];
    [frontLabel release];
    
    [backView release];
    [backLabel release];
    
    [super dealloc];
}

@end

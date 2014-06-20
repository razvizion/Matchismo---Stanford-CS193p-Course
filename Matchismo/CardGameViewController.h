//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Michał Kozak on 07.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//
// Abstract class. Must implement methods as descibed below

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"
@interface CardGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;


// protected
// for subclasses
-(CardMatchingGame *)getGame;
-(NSArray *)getCardButtons;
-(Deck *)createDeck; // abstrack
-(void)redeal;
-(void)updateUI;

@end

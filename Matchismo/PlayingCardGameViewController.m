//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Michał Kozak on 10.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)redealButtonPressed:(UIButton *)sender {
    [self redeal];
}


@end

//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Michał Kozak on 08.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject

// designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(void)setGameDifficulty:(int)gameDifficulty;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSMutableArray *message;

@end

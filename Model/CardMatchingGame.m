//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Michał Kozak on 08.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) int gameDifficulty;
@property (nonatomic, strong) NSMutableArray *chosenCards; // of Card
@property (nonatomic, readwrite) NSMutableArray *message;
@end

@implementation CardMatchingGame

-(NSMutableArray *)message
{
    if (!_message) {
        _message = [[NSMutableArray alloc]init];
    }
    return _message;
}

-(NSMutableArray *)cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(NSMutableArray *)chosenCards
{
    if(!_chosenCards){
        _chosenCards = [[NSMutableArray alloc]init];
    }
    return _chosenCards;
}


- (void)setGameDifficulty:(int)gameDifficulty{
    _gameDifficulty = gameDifficulty;
}


-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self){
        for (int i =0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if(card){
                //self.cards[i] = card;
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
        }
    }
    return self;
}
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int MATCH_BONUS_3 = 10;
static const int COST_TO_CHOSE = 1;
-(void)chooseCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            // match against another card
            
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched){
                    [self.chosenCards addObject: otherCard];
                    
                    if([self.chosenCards count]>=self.gameDifficulty) break;
                }
            }
            
            if([self.chosenCards count]>0){
            int matchScore = [card match:self.chosenCards];
            if(matchScore){
                
                if(self.gameDifficulty < 2){
                    card.matched = YES;
                    for (Card * card in self.chosenCards) {
                        card.matched = YES;
                    }
                    self.chosenCards = nil;
                   // otherCard.matched = YES;
                    self.score += matchScore * MATCH_BONUS;
                }else if((self.gameDifficulty > 2) && (self.gameDifficulty -1 == ([self.chosenCards count]))){
                    
                    self.score += matchScore * MATCH_BONUS_3;
                    card.matched = YES;
                    for (Card * card in self.chosenCards) {
                        card.matched = YES;
                    }
                    self.chosenCards = nil;
            
                }
            }else{
                
                [self.message removeAllObjects];
                [self.message addObject:card.contents];
                
                for (Card * card in self.chosenCards) {
                    card.chosen = NO;
                    [self.message  addObject:card.contents];
                    
                }
                
                self.score -= MISMATCH_PENALTY;
                self.chosenCards = nil;
            }
            }
            /*
            
            for (Card *otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched){
                    
                    [self.chosenCards addObject: otherCard];
            
                    int matchScore = [card match:self.chosenCards];
                   
                    if(matchScore){
                        if(_gameDifficulty < 2){
                            card.matched = YES;
                            otherCard.matched = YES;
                            self.score += matchScore * MATCH_BONUS;
                        }else if(_gameDifficulty > 2 && _gameDifficulty == [self.chosenCards count] -1){
                            self.score += matchScore * MATCH_BONUS_3;
                            card.matched = YES;
                            for (Card * card in self.chosenCards) {
                                card.matched = YES;
                            }
                        }
                        
                    }else{
                        
                        if(_gameDifficulty > 2){
                           self.score -= MISMATCH_PENALTY_3;
                            
                        }else{
                           self.score -= MISMATCH_PENALTY;
                          //  otherCard.chosen = NO;
                        }
                        for (Card * card in self.chosenCards) {
                            NSLog(@"%d",_gameDifficulty);
                            int indexR = [self.cards indexOfObject:card];
                            NSLog(@"%d",indexR);
                            Card *cardR = [self cardAtIndex:indexR];
                            cardR.chosen = NO;
                        }
                        self.chosenCards = nil;
                        
                    }
                    
                }
               
            }*/
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
             self.chosenCards = nil;
            
        }
    }
    
    
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])? self.cards[index] : nil;
}


-(instancetype)init{
    return nil;
}

@end

//
//  SetDeck.m
//  Matchismo
//
//  Created by Michał Kozak on 11.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

-(instancetype)init
{
    
    self = [super init];
    
    if(self){
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSUInteger number = 1; number <= [SetCard maxNumber]; number++) {
                for (NSNumber *color in [SetCard validColors]) {
                    for (NSNumber *shading in [SetCard validShadings]) {

                        SetCard *card = [[SetCard alloc]init];
                        card.shading = shading.unsignedIntegerValue;
                        card.color = color.unsignedIntegerValue;
                        card.symbol = symbol;
                        card.number = number;
                        [self addCard:card];
                    }
                }
            }
        }
        
        
    }
    
    return self;
}

@end

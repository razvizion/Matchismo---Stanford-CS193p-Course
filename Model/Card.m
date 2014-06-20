//
//  Card.m
//  Matchismo
//
//  Created by Michał Kozak on 07.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "Card.h"

@interface Card()


@end

@implementation Card


-(int)match:(NSArray *)otherCards
{
    int score = 0;

    for (Card *card in otherCards) {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}

@end

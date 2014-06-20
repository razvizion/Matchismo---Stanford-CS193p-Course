//
//  SetCard.h
//  Matchismo
//
//  Created by Michał Kozak on 11.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "Card.h"

typedef enum : NSUInteger {
    Dotted,
    Filled,
    Stroked,
} Shading;
typedef enum : NSUInteger {
    Red,
    Green,
    Blue,
} Color;


@interface SetCard : Card

@property (strong, nonatomic) NSString *symbol;
@property (nonatomic) Shading shading;
@property (nonatomic) Color color;
@property (nonatomic) NSUInteger number;

+(NSArray *)validShadings;
+(NSArray *)validColors;
+(NSArray *)validSymbols;
+(NSUInteger)maxNumber;




@end

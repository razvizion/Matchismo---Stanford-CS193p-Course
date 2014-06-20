//
//  Card.h
//  Matchismo
//
//  Created by Michał Kozak on 07.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)card;

@end

//
//  SetCard.m
//  Matchismo
//
//  Created by Michał Kozak on 11.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol  = _symbol;


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    NSString *symbols = [[NSMutableString alloc]init];
    NSString *colors = [[NSMutableString alloc]init];
    NSString *shadings = [[NSMutableString alloc]init];
    NSString *numbers = [[NSMutableString alloc]init];
        for (SetCard *otherCard in otherCards) {
            if([self.symbol isEqualToString:otherCard.symbol]){
                symbols = [symbols stringByAppendingString:@"1"];
            }
            else{
                symbols = [symbols stringByAppendingString:@"0"];
            }
            if(self.color == otherCard.color){
                colors = [colors stringByAppendingString:@"1"];
            }else{
                colors = [colors stringByAppendingString:@"0"];
            }
            if(self.shading == otherCard.shading){
                shadings = [shadings stringByAppendingString:@"1"];
            }else{
                shadings = [shadings stringByAppendingString:@"0"];
            }
            if(self.number == otherCard.number){
                numbers = [numbers stringByAppendingString:@"1"];
            }else{
                numbers = [numbers stringByAppendingString:@"0"];
            }
            
        }
    int error = 0;
    if([symbols isEqualToString:@"0"] || [symbols isEqualToString:@"1"] || [symbols isEqualToString:@"00"] || [symbols isEqualToString:@"11"]){
       
    }else{
        error = 1;
    }
    if([colors isEqualToString:@"0"] || [colors isEqualToString:@"1"] || [colors isEqualToString:@"00"] || [colors isEqualToString:@"11"]){
     
    }else{
        error = 1;
    }
    if([shadings isEqualToString:@"0"] || [shadings isEqualToString:@"1"] || [shadings isEqualToString:@"00"] || [shadings isEqualToString:@"11"]){
    
    }else{
        error = 1;
    }
    if([numbers isEqualToString:@"0"] || [numbers isEqualToString:@"1"] || [numbers isEqualToString:@"00"] || [numbers isEqualToString:@"11"]){
       
    }else{
        error = 1;
    }
    if(error == 1){
        score = 0;
    }else{
        score = 1;
    }
    NSLog(@"%@",symbols);
    
    
    return score;
}


+(NSArray *)validColors
{
    return @[[NSNumber numberWithUnsignedInt:Red],[NSNumber numberWithUnsignedInt:Green],[NSNumber numberWithUnsignedInt:Blue]];
}
+(NSArray *)validShadings
{
    return @[[NSNumber numberWithUnsignedInt:Dotted],[NSNumber numberWithUnsignedInt:Filled],[NSNumber numberWithUnsignedInt:Stroked]];
}

+(NSUInteger)maxNumber{
    return [self numbers].count;
}

-(NSString *)contents{
    return @"";
}

+ (NSArray *)numbers
{
    return @[@1,@2,@3];
}
+(NSArray *)validSymbols
{
    return @[@"◼︎",@"▲",@"●"];

}
-(void)setSymbol:(NSString *)symbol
{
    if([[SetCard validSymbols] containsObject: symbol]){
        _symbol = symbol;
    }
}

- (NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

-(void)setNumber:(NSUInteger)number
{
    if(number <= [SetCard maxNumber])
    {
        _number = number;
    }
    
}
-(void)setShading:(Shading)shading
{
    if([[SetCard validShadings] containsObject:[NSNumber  numberWithUnsignedInt:shading]])
    {
        _shading = shading;
    }
}
-(void)setColor:(Color)color
{
    if([[SetCard validColors] containsObject:[NSNumber  numberWithUnsignedInt:color]])
    {
        _color = color;
    }
}






@end

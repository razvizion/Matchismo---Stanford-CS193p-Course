//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Michał Kozak on 11.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetDeck.h"
#import "SetCard.h"

@interface SetGameViewController () <UITabBarControllerDelegate>

@property (nonatomic,strong) CardMatchingGame *game;
@property (nonatomic,strong) NSArray *cardButtons;
@property (nonatomic) NSMutableAttributedString *symbol;
@end

@implementation SetGameViewController


-(CardMatchingGame *)game
{
    if(!_game){
        _game = [super getGame];
    }
    return _game;
}
-(NSArray *)cardButtons
{
    if(!_cardButtons){
        _cardButtons = [super getCardButtons];
        
    }
    return _cardButtons;
}

- (Deck *)createDeck
{
    return [[SetDeck alloc]init];
}
- (IBAction)redealButtonPressed:(UIButton *)sender {
    [self redeal];
}

- (void)updateUI
{
    [self.game setGameDifficulty:3];
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        
        self.symbol = [[NSMutableAttributedString alloc]init];
        NSAttributedString *string = [[NSAttributedString alloc]initWithString: ((SetCard *)card).symbol];
        for (NSUInteger i = 1 ; i<=((SetCard *)card).number; i++) {
            [self.symbol appendAttributedString:string];
        }
   
        switch (((SetCard *)card).color) {
            case Red:
                [self.symbol addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:(NSRange){0, self.symbol.length}];
                [self.symbol addAttribute:NSStrokeColorAttributeName value:[UIColor redColor] range:(NSRange){0, self.symbol.length}];
                break;
            case Green:
                [self.symbol addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:(NSRange){0, self.symbol.length}];
                [self.symbol addAttribute:NSStrokeColorAttributeName value:[UIColor greenColor] range:(NSRange){0, self.symbol.length}];
                break;
            case Blue:
                [self.symbol addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:(NSRange){0, self.symbol.length}];
                [self.symbol addAttribute:NSStrokeColorAttributeName value:[UIColor blueColor] range:(NSRange){0, self.symbol.length}];
                break;
                
            default:
                break;
        }
        switch (((SetCard *)card).shading) {
            case Dotted:
                [self.symbol addAttribute:NSStrikethroughStyleAttributeName  value:@(NSUnderlineStyleDouble) range:(NSRange){0, self.symbol.length}];
                [self.symbol addAttribute:NSStrikethroughColorAttributeName  value:[UIColor whiteColor] range:(NSRange){0, self.symbol.length}];
                break;
            case Filled:
                
                break;
            case Stroked:
                     [self.symbol addAttribute:NSStrokeWidthAttributeName value:@5 range:(NSRange){0, self.symbol.length}];
                [self.symbol addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:(NSRange){0, self.symbol.length}];
                
                break;
                
            default:
                break;
        }
        
        [cardButton setAttributedTitle: self.symbol forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        super.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        NSString * messageString = [NSString stringWithFormat:@"%@",[self.game.message firstObject]? @"Carsd: " : @"Game started"];
        
        if([self.game.message firstObject]){
            
            for(NSString *string in self.game.message) {
                messageString = [messageString stringByAppendingFormat:@"%@ ,", string];
            }
            messageString = [messageString stringByAppendingString:@" doesn't match"];
            
        }
        self.messageLabel.text = messageString;
    }
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen? @"hue": @"cardfront"];
}


@end

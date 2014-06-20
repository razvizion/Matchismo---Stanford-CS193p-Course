//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Michał Kozak on 07.06.2014.
//  Copyright (c) 2014 razvizion. All rights reserved.
//

#import "CardGameViewController.h"
#import "SetGameViewController.h"


@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchCountControl;
@end

@implementation CardGameViewController

-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(CardMatchingGame *)getGame
{
    return [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
}
-(NSArray *)getCardButtons
{
    return self.cardButtons;
}

-(Deck *)createDeck{ // Abstract
    
    return nil;
}

-(void)redeal
{
    self.game = nil;
    [self game];
    [self updateUI];
}

- (IBAction)changeGameDifficulty:(UISegmentedControl *)sender {
    int dif = [[sender titleForSegmentAtIndex: sender.selectedSegmentIndex] intValue];
    [self.game setGameDifficulty:dif];
    
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
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

-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen || [self.tabBarController.selectedViewController isKindOfClass:[SetGameViewController class]]? card.contents :nil;
}
-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen || [self.tabBarController.selectedViewController isKindOfClass:[SetGameViewController class]]? @"cardfront": @"cardback"];
}


@end

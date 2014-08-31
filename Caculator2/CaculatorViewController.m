//
//  CaculatorViewController.m
//  Caculator2
//
//  Created by yesa on 2014/8/24.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "CaculatorViewController.h"
#import "CaculatorBrain.h"

@interface CaculatorViewController ()
@property (nonatomic) BOOL isUserInMiddle;
@property (nonatomic) BOOL isEqualPressed;
@property (nonatomic,strong) CaculatorBrain *brain;
@end

@implementation CaculatorViewController

@synthesize display = _display;
@synthesize isUserInMiddle = _isUserInMiddle;
@synthesize brain = _brain;
@synthesize isEqualPressed = _isEqualPressed;


-(CaculatorBrain *)brain
{
    if (_brain == nil) {
        _brain = [[CaculatorBrain alloc] init];
    }
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.isUserInMiddle) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.isUserInMiddle = YES;
    }

}
- (IBAction)operationPressed:(UIButton *)sender
{
    double result = 0;
    [self.brain pushOperator:sender.currentTitle];

    if([self.brain isCanPerformOperation]){
        result = [self.brain performOperation];
        self.display.text = [NSString stringWithFormat:@"%g", result];
    }
    [self.brain pushOperand:self.display.text.doubleValue];
    self.isUserInMiddle = NO;
    //double result = [self.brain performOperation:sender.currentTitle];
    //self.display.text = [NSString stringWithFormat:@"%g", result];
    //self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
    //self.isEqualPressed = NO;

}
- (IBAction)enterPressed
{
    [self.brain pushOperand:self.display.text.doubleValue];
    self.display.text = [NSString stringWithFormat:@"%g", [self.brain performOperation]];
    self.isUserInMiddle = NO;
}

@end

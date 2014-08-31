//
//  CaculatorBrain.m
//  Caculator2
//
//  Created by yesa on 2014/8/24.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import "CaculatorBrain.h"

@interface CaculatorBrain()
@property (nonatomic,strong) NSMutableArray *operandStack;
@property (nonatomic,strong) NSMutableArray *operatorStack;

@end

@implementation CaculatorBrain

@synthesize operandStack = _operandStack;
@synthesize operatorStack = _operatorStack;

-(NSMutableArray *)operandStack
{
    if(_operandStack == nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
    
}

-(NSMutableArray *)operatorStack
{
    if(_operatorStack == nil) {
        _operatorStack = [[NSMutableArray alloc] init];
    }
    return _operatorStack;
    
}

-(double) popOperand
{
    NSNumber *operatorObject = self.operandStack.lastObject;
    if (self.operandStack != nil) {
        [self.operandStack removeLastObject];
    }

    return operatorObject.doubleValue;
}

-(void) pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
    
}

-(NSString *) popOperator
{
    NSString *operatorObject = self.operatorStack.lastObject;
    if (self.operatorStack != nil) {
        [self.operatorStack removeLastObject];
    }
    
    return operatorObject;
}

-(void) pushOperator:(NSString *)operator
{
    [self.operatorStack addObject:operator];
    
}

-(double) performOperation
{
    NSString *operation = [self popOperator];
    double operandA = [self popOperand];
    double operandB = [self popOperand];
    NSLog(@"%@",operation);
    NSLog(@"%g",operandA);
    NSLog(@"%g",operandB);
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = operandB + operandA;
    } else if([operation isEqualToString:@"-"]) {
        result = operandB - operandA;
    } else if([operation isEqualToString:@"*"]) {
        result = operandB * operandA;
    } else if([operation isEqualToString:@"/"]) {
        result = operandB / operandA;
    }
    //[self pushOperand:result];
    NSLog(@"resutl = %g",result);
    return result;
}

-(void) clearStack
{
    //[self.operatorStack removeAllObjects];
    //[self.operandStack removeAllObjects];
}

-(BOOL) isCanPerformOperation
{
    if (self.operandStack.count > 1) {
        return YES;
    }else {
        return NO;
    }
}

@end

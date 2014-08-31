//
//  CaculatorBrain.h
//  Caculator2
//
//  Created by yesa on 2014/8/24.
//  Copyright (c) 2014年 com.test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorBrain : NSObject

-(void) pushOperand:(double)operand;
-(void) pushOperator:(NSString *)operator;
-(double) performOperation;
-(BOOL) isCanPerformOperation;
-(void) clearStack;

@end

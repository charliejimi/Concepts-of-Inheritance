//
//  CalculatorBrain.m
//  Calculator
//
//  Created by CS193p Instructor.
//  Copyright (c) 2011 Stanford University.
//  All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain

@synthesize programStack = _programStack;

- (NSMutableArray *)programStack
{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (id)program
{
    return [self.programStack copy];
}

+ (NSString *)descriptionOfProgram:(id)program
{
    return @"Implement this in Homework #2";
}

- (void)pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    
    
    if ([[self class] isSubclassOfClass:[CalculatorBrain class]]) {
        NSLog(@"YES");
    }
    
    NSLog(@"%p",self);// 這個self指的是SubCalculator這個class的實體的指標
    return [self runProgram:self.program];
        
    NSLog(@"%p",[self class]);// 這個[self class]所指向的位址是SubCalculator這個class的實體的類別(就是SubCalculator 這個類別)
    //return [[self class] runProgram:self.program];
    
    
    NSLog(@"%p", [CalculatorBrain class]);//這個[CalculatorBrain class]所指向的位址是CalculatorBrain 
    
    //return [CalculatorBrain runProgram:self.program];
    
    //return [[super class] runProgram:self.program];
    

}


- (double)runProgram:(id)program{
    
    NSLog(@"你呼叫錯誤了! 我不是類別方法啦！我是subCalculator的父類別的物件方法");
    return 0;
}
+ (double)popOperandOffProgramStack:(NSMutableArray *)stack
{
    double result = 0;

    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]])
    {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        if ([operation isEqualToString:@"+"]) {
            result = [self popOperandOffProgramStack:stack] +
                     [self popOperandOffProgramStack:stack];
        } else if ([@"*" isEqualToString:operation]) {
            result = [self popOperandOffProgramStack:stack] *
                     [self popOperandOffProgramStack:stack];
        } else if ([operation isEqualToString:@"-"]) {
            double subtrahend = [self popOperandOffProgramStack:stack];
            result = [self popOperandOffProgramStack:stack] - subtrahend;
        } else if ([operation isEqualToString:@"/"]) {
            double divisor = [self popOperandOffProgramStack:stack];
            if (divisor) result = [self popOperandOffProgramStack:stack] / divisor;
        }
    }

    return result;
}

+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    
    NSLog(@" hi 你呼叫對了,我是正確的CalculatorBrain");
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOffProgramStack:stack];
}

@end

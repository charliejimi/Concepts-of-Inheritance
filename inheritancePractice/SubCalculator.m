//
//  SubCalculator.m
//  inheritancePractice
//
//  Created by Charlie  on 12/11/10.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "SubCalculator.h"

@implementation SubCalculator

+ (double)runProgram:(id)program{
    NSLog(@"hi 你呼叫錯誤了,我是繼承CalculatorBrain的兒子,我是subCalculator的類別方法");
    return 0;
}
- (double)runProgram:(id)program{
    
    NSLog(@" ＠＠？ 你呼叫錯誤了! 我不是類別方法啦！我是subCalculator的物件方法 ");
    return 0;
}
@end

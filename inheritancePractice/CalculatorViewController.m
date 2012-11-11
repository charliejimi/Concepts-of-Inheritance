//
//  CalculatorViewController.m
//  inheritancePractice
//
//  Created by Charlie  on 12/11/10.
//  Copyright (c) 2012年 Charlie . All rights reserved.
//

#import "CalculatorViewController.h"
#import "SubCalculator.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    SubCalculator * aCalculator= [[SubCalculator alloc]init];
    NSLog(@"%p",aCalculator);
    
    [aCalculator pushOperand:1];
    [aCalculator pushOperand:2];
    [aCalculator performOperation:@"+"];
///////////// Polymorphism ///////////////////////////
    
    CalculatorBrain *aBrain=nil;
    aBrain=[[SubCalculator alloc]init];    
    id banana;
    [aBrain runProgram: banana];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

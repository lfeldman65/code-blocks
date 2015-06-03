//
//  ViewController.m
//  BlockDemo
//
//  Created by Larry Feldman on 5/18/15.
//  Copyright (c) 2015 Larry Feldman. All rights reserved.
//
//  Blocks are objects.
//  Blocks are lexical, which means they can read and capture the current state of any local
//  variables, parameters and variables on the stack.
//  Typically block are used for:
//  Completion Handlers
//  Error Handlers
//  Notification Handlers
//  Enumeration
//  View animation and transitions
//  Sorting
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)button1Pressed:(id)sender;
- (IBAction)button2Pressed:(id)sender;
- (IBAction)button3Pressed:(id)sender;
- (IBAction)button4Pressed:(id)sender;

-(void)performMathOperation:(void (^)(NSInteger, NSInteger))mathOperationBlock;
-(void)countToTenThousandAndReturnCompletionBlock:(void (^)(BOOL))completed;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1Pressed:(id)sender {
    
    NSInteger (^mathOperation)(NSInteger x, NSInteger y) = ^NSInteger(NSInteger x, NSInteger y) { // first x and y are optional.
        
        return x + y;
        
    }; // Block declaration
    
    NSInteger sum = mathOperation(1, 2); // Block call
    
    NSLog(@"Sum of 1 and 2 is %li", (long)sum);
    
}

- (IBAction)button2Pressed:(id)sender {
    
    NSInteger z = 30;               // z is read-only inside block
    //    __block NSInteger z = 30;     // block can read and write z
    
    NSInteger (^mathOperation)(NSInteger, NSInteger) = ^NSInteger(NSInteger x, NSInteger y) {
        
        return x + y + z;
        
    };
    
    NSLog(@"Sum is %li", mathOperation(10, 20));
    
}


- (IBAction)button3Pressed:(id)sender {
    
    [self performMathOperation:^(NSInteger x, NSInteger y) {
        
        NSLog(@"This is x and y: %li and %li", (long)x, (long)y);
        
    }];
    
}

-(void)performMathOperation:(void (^)(NSInteger, NSInteger))mathOperationBlock {  // for button 3
    
    
    mathOperationBlock(3, 4);
}



- (IBAction)button4Pressed:(id)sender {
    
    
    [self countToTenThousandAndReturnCompletionBlock:^(BOOL completed) {
        
        if(completed) {
            
            NSLog(@"done counting");
        }
        
    }];
    
}

-(void)countToTenThousandAndReturnCompletionBlock:(void (^)(BOOL))completed {  // for button 4
    
    
    int x = 1;
    while (x < 10001) {
        
        NSLog(@"%i", x);
        x++;
        
    }
    
    completed(YES);
    
}



@end

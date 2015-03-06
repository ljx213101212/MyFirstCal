//
//  ViewController.h
//  SampleCal
//
//  Created by 李继庠 on 3/6/15.
//  Copyright (c) 2015 李继庠. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {PLUS,MINUS,MUTIPLY,DIVIDE} CaculationOperator;
#define myValueString(enum) [@[@"1",@"2",@"3",@"4"] objectAtIndex:enum]


@interface ViewController : UIViewController{
    IBOutlet UITextField *display;
    NSString *storage;
    NSArray *operations;
    CaculationOperator operation;
}


-(IBAction)addButtons;
-(IBAction)addOperators;
-(IBAction)numberSelected:(id)sender;
-(IBAction)operatorSelected:(id)sender;

@end

 
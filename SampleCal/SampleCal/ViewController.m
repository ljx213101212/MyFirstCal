//
//  ViewController.m
//  SampleCal
//
//  Created by 李继庠 on 3/6/15.
//  Copyright (c) 2015 李继庠. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

int NumberOfButtons = 10; // the number of Number Buttons
int ButtonsOfOperator = 6;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addButtons];
    operations = [NSArray arrayWithObjects:@"c",@"=",@"+",@"-", @"x" ,@"/",nil];
    [self addOperators];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(IBAction)addStatusBar{
 
    // This allocates a label
    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //This sets the label text
    prefixLabel.text =@"## ";
    // This sets the font for the label
    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
    // This fits the frame to size of the text
    [prefixLabel sizeToFit];
 
    display = [[UITextField  alloc] initWithFrame:
    CGRectMake(20, 50, 280, 30)];
    display.borderStyle = UITextBorderStyleRoundedRect;
    display.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    [display setFont:[UIFont boldSystemFontOfSize:12]];
    
    //display.text = [NSString stringWithFormat:@"%d" , 1234];
    [self.view addSubview:display];
 
    // This sets the border style of the text field
    display.borderStyle = UITextBorderStyleRoundedRect;
    display.contentVerticalAlignment =
    UIControlContentVerticalAlignmentCenter;
    [display setFont:[UIFont boldSystemFontOfSize:12]];
    
    //Placeholder text is displayed when no text is typed
    display.placeholder = @"Simple Text field";
    
    //Prefix label is set as left view and the text starts after that
    display.leftView = prefixLabel;
    
    //It set when the left prefixLabel to be displayed
    display.leftViewMode = UITextFieldViewModeAlways;
    
    // Adds the textField to the view.
    [self.view addSubview:display];
    
    // sets the delegate to the current class
    //display.delegate = self;
     
 
}
*/
-(IBAction)addButtons{
    
    for (int i = 0 ; i < NumberOfButtons ; i++){
        
        UIButton *numberButtons = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [numberButtons setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [numberButtons addTarget:self action:@selector(numberSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        if ( i < 1 ) {
            numberButtons.frame = CGRectMake(29, 367.5, 58, 50);
        }
        
        if ( i >= 1 && i < 4 ){
            numberButtons.frame = CGRectMake(29 + 68 * (i-1) , 312.5, 58 , 50);
        }
        
        if ( i >= 4 && i < 7 ){
            numberButtons.frame = CGRectMake(29 + 68 * (i-4), 257.5, 58, 50);
        }
        
        if ( i >= 7 && i < 10 ){
            numberButtons.frame = CGRectMake(29 + 68 * (i-7), 202.5, 58, 50);
        }
        
        [self.view addSubview:numberButtons];
        
    }
}

-(IBAction)addOperators{
    for (int i = 0 ; i < ButtonsOfOperator ; i ++){
        
        UIButton *ButtonsOfOperator = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [ButtonsOfOperator setTitle: [operations objectAtIndex:i] forState:UIControlStateNormal];
        [ButtonsOfOperator addTarget:self action:@selector(operatorSelected:) forControlEvents:UIControlEventTouchUpInside];
        
        if (0<=i<3){
            ButtonsOfOperator.frame = CGRectMake(97+(68*i), 367.5, 58, 50);
        }
        if (i == 3){
            ButtonsOfOperator.frame = CGRectMake(97+(68*(i-1)), 312.5, 58, 50);
        }
        if (i == 4) {
            ButtonsOfOperator.frame = CGRectMake(97+(68*(i-2)), 257.5, 58, 50);
        }
        
        if (i == 5) {
            ButtonsOfOperator.frame = CGRectMake(97+(68*(i-3)), 202.5, 58, 50);
        }
        
        
        [self.view addSubview:ButtonsOfOperator];
      //  if (i )
        
    }
}




-(IBAction)numberSelected:(id)sender{
    
    NSString *buttonValue = [sender titleForState:UIControlStateNormal];
    NSString *storeString = @"";
    
     // display.text = storeString;
    for (int i = 0 ; i < NumberOfButtons ; i ++){
        storeString = [NSString stringWithFormat:@"%@%d",display.text,i];
        //printf("%s", [storeString UTF8String]);
        if ([buttonValue isEqualToString:[NSString  stringWithFormat:@"%d",i]]){
            display.text = storeString;
        }
    }
    
}

-(IBAction)operatorSelected:(id)sender{
    
    NSString *operatorValue = [sender titleForState:UIControlStateNormal];
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@",[operations objectAtIndex:0]]]){
        display.text = @"";
        
    }
    
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@",[operations objectAtIndex:2]]]){
        operation = PLUS;
        storage = display.text;
        display.text = @"";
        
    }
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@",[operations objectAtIndex:3]]]){
        operation = MINUS;
        storage = display.text;
        display.text = @"";
        
    }
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@",[operations objectAtIndex:4]]]){
        
        operation = MUTIPLY;
        storage = display.text;
        display.text = @"";
        
    }
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@",[operations objectAtIndex:5]]]){
        operation = DIVIDE;
        storage = display.text;
        display.text = @"";
    }
    
    if ([operatorValue isEqualToString:[NSString stringWithFormat:@"%@", [operations objectAtIndex:1]]]){
        [self getResults];
    }
    
}
         
-(IBAction) getResults{

    NSString * secondNumber = display.text;
    NSLog(@"The enum value is '%@'.", myValueString(operation));
    NSLog([NSString stringWithFormat:@"%f" ,[storage doubleValue]]);
    switch (operation) {
        case PLUS:
            display.text = [NSString stringWithFormat:@"%f", [storage doubleValue] + [secondNumber doubleValue]];
            break;
            
        case MINUS:
            display.text = [NSString stringWithFormat:@"%f", [storage doubleValue] - [secondNumber doubleValue]];
            break;
            
        case MUTIPLY:
            display.text = [NSString stringWithFormat:@"%f", [storage doubleValue] * [secondNumber doubleValue]];
            break;
            
        case DIVIDE:
            display.text = [NSString stringWithFormat:@"%f", [storage doubleValue] / [secondNumber doubleValue]];
            break;
        default:
            NSLog(@"Operation System Error!");
            break;
    }
    
    
    
}



@end

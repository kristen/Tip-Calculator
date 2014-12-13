//
//  ViewController.m
//  TipCalc
//
//  Created by Kristen on 12/13/14.
//  Copyright (c) 2014 Kristen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *billTextfield;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *percentSegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *finalText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    float billValue = [finalText floatValue];
    
    [self updateTipLabelsForBillAmount:billValue];
    
    return YES;
}
- (IBAction)percentValueChanged:(UISegmentedControl *)sender
{
    float billAmount = [self.billTextfield.text floatValue];
    [self updateTipLabelsForBillAmount:billAmount];
}

- (void)updateTipLabelsForBillAmount:(float)billAmount
{
    float tipPercentage = 0;
    
    switch (self.percentSegmentedControl.selectedSegmentIndex) {
        case 0: // 15%
            tipPercentage = .15;
            break;
        case 1: // 20%
            tipPercentage = .2;
            break;
        case 2: // 25%
            tipPercentage = .25;
            break;
            
        default:
            break;
    }
    
    float tipAmount =  billAmount * tipPercentage;
    float total = billAmount + tipAmount;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", total];
}

@end

//
//  ViewController.m
//  CustomKeyboard
//
//  Copyright (c) bonegollira. All rights reserved.
//



#import "ViewController.h"



@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *_textField;

@end



@implementation ViewController

- (void)viewDidUnload
{
    __textField.delegate = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __textField = UITextField.new;
    __textField.delegate = self;
    
    [self.view addSubview:__textField];
    
    [self configure];
    
    [__textField becomeFirstResponder];
}

- (void)viewDidLayoutSubviews
{
    CGSize viewSize = self.view.bounds.size;
    
    __textField.frame = (CGRect) {
        .origin.x = 20,
        .origin.y = 20,
        .size.width = viewSize.width - 40,
        .size.height = 50
    };
}

#pragma mark - configure

- (void)configure
{
    [self configure__textField];
}

- (void)configure__textField
{
    __textField.textColor = UIColor.grayColor;
    __textField.font = [UIFont fontWithName:@"HelveticaNeue"
                                       size:12.f];
    __textField.keyboardType = UIKeyboardTypeDefault;
    __textField.returnKeyType = UIReturnKeyDefault;
    __textField.clearButtonMode = UITextFieldViewModeAlways;
    __textField.keyboardAppearance = UIKeyboardAppearanceLight;
    __textField.placeholder = @"input here";
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end

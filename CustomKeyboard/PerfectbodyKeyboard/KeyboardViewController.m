//
//  KeyboardViewController.m
//  PerfectbodyKeyboard
//
//  Copyright (c) bonegollira. All rights reserved.
//



#import "KeyboardViewController.h"



@interface KeyboardViewController ()

@property (nonatomic, strong) UIButton *_nextKeyboardButton;
@property (nonatomic, strong) UIButton *_deleteButton;
@property (nonatomic, strong) UIButton *_aButton;
@property (nonatomic, strong) UIButton *_safariButton;

@end



@implementation KeyboardViewController

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
    // autolaytou
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     *
     * must implements [change keyboard button] like earth icon.
     *
     */
    
    // Perform custom UI setup here
    __nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    __deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    __aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    __safariButton = [UIButton buttonWithType:UIButtonTypeCustom];
    

    [self.view addSubview:__nextKeyboardButton];
    [self.view addSubview:__deleteButton];
    [self.view addSubview:__aButton];
    [self.view addSubview:__safariButton];
    
    [self configure];
}

- (void)viewDidLayoutSubviews
{
    CGSize viewSize = self.view.bounds.size;
    
    __nextKeyboardButton.frame = (CGRect) {
        .origin.y = viewSize.height - 44,
        .size.width = viewSize.width,
        .size.height = 44
    };
    
    __deleteButton.frame = (CGRect) {
        .origin.y = viewSize.height - 88,
        .size.width = viewSize.width,
        .size.height = 44
    };
    
    __aButton.frame = (CGRect) {
        .size.width = 50,
        .size.height = 50
    };
    
    __safariButton.frame = (CGRect) {
        .origin.x = viewSize.width - 60,
        .size.width = 60,
        .size.height = 60
    };
}

#pragma mark - configure

- (void)configure
{
    [self configure_self];
    [self configure__nextKeyboardButton];
    [self configure__deleteButton];
    [self configure__aButton];
    [self configure__safariButton];
}

- (void)configure_self
{
//    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)configure__nextKeyboardButton
{
    __nextKeyboardButton.backgroundColor = UIColor.grayColor;
    
    [__nextKeyboardButton setTitle:@"next"
                          forState:UIControlStateNormal];
    [__nextKeyboardButton setTitleColor:UIColor.whiteColor
                               forState:UIControlStateNormal];
    
    // - (void)advanceToNextInputMode is super method change keyboard.
    [__nextKeyboardButton addTarget:self
                             action:@selector(advanceToNextInputMode)
                   forControlEvents:UIControlEventTouchUpInside];
}

- (void)configure__deleteButton
{
    __deleteButton.backgroundColor = UIColor.blackColor;
    
    [__deleteButton setTitle:@"delete"
                    forState:UIControlStateNormal];
    [__deleteButton setTitleColor:UIColor.whiteColor
                         forState:UIControlStateNormal];
    
    [__deleteButton addTarget:self
                       action:@selector(delete:)
             forControlEvents:UIControlEventTouchUpInside];
}

- (void)configure__aButton
{
    __aButton.backgroundColor = UIColor.lightGrayColor;
    __aButton.layer.masksToBounds = YES;
    __aButton.layer.cornerRadius = 4;
    [__aButton setTitle:@"a"
               forState:UIControlStateNormal];
    [__aButton setTitleColor:UIColor.whiteColor
                    forState:UIControlStateNormal];
    [__aButton addTarget:self
                  action:@selector(a:)
        forControlEvents:UIControlEventTouchUpInside];
}

- (void)configure__safariButton
{
    __safariButton.layer.masksToBounds = YES;
    __safariButton.layer.cornerRadius = 4;
    [__safariButton setImage:[UIImage imageNamed:@"Safari.png"]
                    forState:UIControlStateNormal];
    [__safariButton addTarget:self
                       action:@selector(safari:)
             forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - text change

/*
 *
 * ?
 *
 */
- (void)textWillChange:(id<UITextInput>)textInput
{
    // The app is about to change the document's contents. Perform any preparation here.
}

/*
 *
 * ?
 *
 */
- (void)textDidChange:(id<UITextInput>)textInput
{
    // The app has just changed the document's contents, the document context has been updated.
    
//    UIColor *textColor = nil;
//    
//    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
//        textColor = [UIColor whiteColor];
//    } else {
//        textColor = [UIColor blackColor];
//    }
//    [__nextKeyboardButton setTitleColor:textColor
//                               forState:UIControlStateNormal];
}

#pragma mark - action

- (void)delete:(UIButton *)sender
{
    [self.textDocumentProxy deleteBackward];
}

- (void)a:(UIButton *)sender
{
    [self.textDocumentProxy insertText:@"A"];
}

- (void)safari:(UIButton *)sender
{
    [self.textDocumentProxy insertText:@"Safari"];
}

@end

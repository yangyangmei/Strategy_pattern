//
//  ViewController.m
//  Strategy_pattern
//
//  Created by YY on 16/6/24.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "ViewController.h"
#import "CustomField.h"
#import "UIButton+inits.h"
#import "UIView+SetRect.h"
#import "EmailValidator.h"
#import "PhoneValidator.h"
#import "UIInfomationView.h"

@interface ViewController ()<UITextFieldDelegate>

/**
 *  邮箱验证框
 */
@property (nonatomic, strong) CustomField *emailField;

/**
 *  电话验证
 */
@property (nonatomic, strong) CustomField *phoneField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTextField];
    [self initButton];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - 初始化文本框
-(void)initTextField{
    self.emailField                = [[CustomField alloc] initWithFrame:CGRectMake(30, 80, Width-50, 30)];
    self.emailField.placeholder    = @"请输入邮箱";
    self.emailField.delegate       = self;
    self.emailField.inputValidator = [EmailValidator new]; //要用子类
    [self.view addSubview:self.emailField];

    self.phoneField                = [[CustomField alloc] initWithFrame:CGRectMake(30, 200, Width-50, 30)];
    self.phoneField.placeholder    = @"请输入电话";
    self.phoneField.inputValidator = [PhoneValidator new];
    self.phoneField.delegate       = self;
    [self.view addSubview:self.phoneField];
}

#pragma mark - 初始化按钮及按钮事件
-(void)initButton{
    
    UIButton *btn = [UIButton createButtonWithFrame:CGRectMake(30, 30, 100, 30) buttonType:0 title:@"验证" tag:0 target:self action:@selector(buttonEvent:)];
    
    [self.view addSubview:btn];
}

- (void)buttonEvent:(UIButton*)btn
{
    [self.view endEditing:YES];
}

#pragma mark - 文本框代理
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CustomField *customField = (CustomField*)textField;
    if ([customField ValidateInput] == NO) {
        [UIInfomationView showAlertViewWithTitle:nil
                                         message:customField.inputValidator.errorMsg
                               cancelButtonTitle:nil
                               otherButtonTitles:@[@"确定"]
                                    clickAtIndex:^(NSInteger buttonIndex) {
                                        
                                    }];

                 }
}


@end

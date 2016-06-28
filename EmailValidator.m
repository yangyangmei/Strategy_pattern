//
//  EmailValidator.m
//  Strategy_pattern
//
//  Created by YY on 16/6/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "EmailValidator.h"
#import "RegExCategories.h"

@implementation EmailValidator

-(BOOL)ValidateInput:(UITextField*)textField
{
    if (textField.text.length <= 0) {
        self.errorMsg = @"没有输入";
    }else{
        BOOL isMatch = [textField.text isMatch:RX(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")];
        if (isMatch == NO) {
            
            self.errorMsg = @"请输入正确的邮箱";
            
        } else {
            
            self.errorMsg = nil;
        }

    }
    return self.errorMsg == nil ? YES:NO;
}
@end

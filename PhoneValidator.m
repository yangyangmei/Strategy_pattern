//
//  PhoneValidator.m
//  Strategy_pattern
//
//  Created by YY on 16/6/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import "PhoneValidator.h"
#import "RegExCategories.h"

@implementation PhoneValidator

-(BOOL)ValidateInput:(UITextField *)textField
{
    if (textField.text.length <= 0) {
        
        self.errorMsg = @"没有输入";
        
    } else {
        
        BOOL isMatch = [textField.text isMatch:RX(@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$")];
        if (isMatch == NO) {
            
            self.errorMsg = @"请输入正确的手机号码";
            
        } else {
            
            self.errorMsg = nil;
        }
    }
    
    return self.errorMsg == nil ? YES : NO;

}
@end

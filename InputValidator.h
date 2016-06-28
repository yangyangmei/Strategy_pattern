//
//  InputValidator.h
//  Strategy_pattern
//
//  Created by YY on 16/6/28.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InputValidator : NSObject

/**
 *  策略的输入，验证输入
 *
 *  @param textField <#textField description#>
 *
 *  @return 如果为YES,表示测试通过,如果为NO,表示测试不通过
 */
-(BOOL)ValidateInput:(UITextField*)textField;


/**
 *  当validateInput为NO的时候,我们来读取errorMessage
 */
@property (nonatomic, retain) NSString *errorMsg;
@end

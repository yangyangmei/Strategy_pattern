//
//  CustomField.h
//  Strategy_pattern
//
//  Created by YY on 16/6/24.
//  Copyright © 2016年 YY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputValidator.h"

@interface CustomField : UITextField

/**
 *  抽象的策略
 */
@property (nonatomic, strong) InputValidator *inputValidator;


-(instancetype)initWithFrame:(CGRect)frame;

/**
 *  验证输入合法性
 *
 *  @return 是否合法,不合法,读取InputValidator当中的errorMessage
 */
-(BOOL)ValidateInput;
@end

//
//  ZZTitleTextField.m
//  AFNetworking
//
//  Created by laixian on 2019/10/15.
//

#import "ZZTitleTextField.h"
#import <Masonry/Masonry.h>

@interface ZZTitleTextField ()

@property (nonatomic ,strong ,readwrite) UILabel *left;
@property (nonatomic ,strong ,readwrite) UITextField *textField;

@end

@implementation ZZTitleTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftWidth = 60;
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    [self addSubview:self.left];
    [self addSubview:self.textField];
    
    [self.left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(self.leftWidth);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.left.equalTo(self.left.mas_right).offset(0);
    }];
}

- (void)setLeftWidth:(NSInteger)leftWidth
{
    _leftWidth = leftWidth;
    [self.left mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.leftWidth);
    }];
}

#pragma mark *********** lazy *********
- (UILabel *)left
{
    if (!_left) {
        _left = [UILabel new];
        _left.font = [UIFont systemFontOfSize:15];
        _left.textAlignment = NSTextAlignmentCenter;
        _left.backgroundColor = [UIColor clearColor];
    }
    return _left;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.backgroundColor = UIColor.clearColor;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.textColor = UIColor.whiteColor;
    }
    return _textField;
}
@end

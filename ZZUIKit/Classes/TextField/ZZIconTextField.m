//
//  ZZIconTextField.m
//  AFNetworking
//
//  Created by laixian on 2019/10/15.
//

#import "ZZIconTextField.h"
#import <Masonry/Masonry.h>
#import <ZZCategory/UIColor+ZZ.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <ZZFoundation/ZZMarcs.h>

@interface ZZIconTextField ()

@property (nonatomic ,strong ,readwrite) UIImageView *leftIcon;
@property (nonatomic ,strong ,readwrite) UITextField *textField;

@end

@implementation ZZIconTextField
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _placeHolderColor = [UIColor colorWithHexStr:@"#797E7C"];
        [self addObserver];
        [self buildUI];
    }
    return self;
}

- (void)addObserver
{
    zzweakify(self)
    [RACObserve(self, textField.placeholder) subscribeNext:^(id  _Nullable x) {
        zzstrongify(self)
        [self reloadPlaceHolder];
    }];
}

- (void)buildUI
{
    self.backgroundColor = [UIColor colorWithHexStr:@"#282C2C"];
    [self addSubview:self.leftIcon];
    [self addSubview:self.textField];
    
    [self.leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.centerY.equalTo(self);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftIcon.mas_right).offset(11);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-30);
    }];
    
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    _placeHolderColor = placeHolderColor;
    [self reloadPlaceHolder];
}


- (void)reloadPlaceHolder
{
    if (self.textField.placeholder.length == 0) return;
    
    self.textField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.textField.placeholder
                                                                          attributes:@{
                                                                                       NSForegroundColorAttributeName:_placeHolderColor,
                                                                                       NSFontAttributeName:self.textField.font
                                                                                       }];
}
#pragma mark *********** lazy *********
- (UIImageView *)leftIcon
{
    if (!_leftIcon) {
        _leftIcon = [UIImageView new];
        _leftIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftIcon;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [UITextField new];
    }
    return _textField;
}
@end


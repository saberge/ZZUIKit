//
//  ZZVerificationCodeView.m
//  AFNetworking
//
//  Created by laixian on 2019/10/19.
//

#import "ZZVerificationCodeView.h"
#import <ZZFoundation/ZZLocalized.h>
#import <ZZCategory/UIColor+ZZ.h>
#import <Masonry/Masonry.h>
#import <ZZFoundation/ZZWeakProxy.h>

NSInteger kMaxCountdown = 60;

@interface ZZVerificationCodeView ()
@property (nonatomic ,strong ,readwrite) ZZIconTextField *textField;
@property (nonatomic ,strong) UIButton  *countDownBtn;
@property (nonatomic ,strong) NSTimer *timer;

@end

@implementation ZZVerificationCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    self.backgroundColor = [UIColor colorWithHexStr:@"#282C2C"];
    [self addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.mas_equalTo(0);
    }];
    
    [self addSubview:self.countDownBtn];
    [self.countDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.width.mas_equalTo(90);
        make.bottom.top.mas_equalTo(0);
        make.left.equalTo(self.textField.mas_right).offset(3);
    }];
}

- (void)send:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(verifyCodeViewDidClickSend:)]) {
        [self.delegate verifyCodeViewDidClickSend:self];
    }
}

- (void)startCount
{
    [self.timer fire];
    self.countDownBtn.userInteractionEnabled = NO;
    [self.textField becomeFirstResponder];
    kMaxCountdown = 60;
}

- (void)countDown
{
    NSInteger remaind = kMaxCountdown--;
    NSString *title = nil;
    if (remaind <= 0) {
        title = Localized(@"registerVerifyCode");
        self.countDownBtn.userInteractionEnabled = YES;

    }
    else{
        title = [NSString stringWithFormat:@"%ds%@",remaind,Localized(@"verifyCodeCountDownTitle")];
        self.countDownBtn.userInteractionEnabled = NO;
    }
    [self.countDownBtn setTitle:title forState:UIControlStateNormal];
}

- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

#pragma mark *********** lazy *********
- (ZZIconTextField *)textField
{
    if (!_textField) {
        _textField = [ZZIconTextField new];
        _textField.leftIcon.image = [UIImage imageNamed:@"register_verifyCode_icon"];
        _textField.textField.placeholder = Localized(@"verifyCodePlaceholder");
        _textField.textField.font = [UIFont systemFontOfSize:15];
        _textField.placeHolderColor = [UIColor colorWithHexStr:@"#797E7C"];
        _textField.textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.textField.returnKeyType = UIReturnKeyNext;
        _textField.textField.textColor = UIColor.whiteColor;
    }
    return _textField;
}

- (UIButton *)countDownBtn
{
    if (!_countDownBtn) {
        _countDownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_countDownBtn setBackgroundColor:UIColor.clearColor];
        _countDownBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_countDownBtn setTitleColor:[UIColor colorWithHexStr:@"#36CB83"] forState:UIControlStateNormal];
        [_countDownBtn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside];
        [_countDownBtn setTitle:Localized(@"registerVerifyCode") forState:UIControlStateNormal];
    }
    return _countDownBtn;
}

- (NSTimer *)timer
{
    if (!_timer) {
        ZZWeakProxy *proxy = [[ZZWeakProxy alloc]initWithObject:self];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxy selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _timer;
}
@end

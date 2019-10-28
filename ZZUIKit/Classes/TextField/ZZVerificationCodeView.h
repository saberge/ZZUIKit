//
//  ZZVerificationCodeView.h
//  AFNetworking
//
//  Created by laixian on 2019/10/19.
//

#import <UIKit/UIKit.h>
#import "ZZIconTextField.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZZVerificationCodeViewDelegate;
@interface ZZVerificationCodeView : UIView
@property (nonatomic , weak) id <ZZVerificationCodeViewDelegate> delegate;
@property (nonatomic ,strong ,readonly) ZZIconTextField *textField;

- (void)startCount;

@end

@protocol ZZVerificationCodeViewDelegate <NSObject>

- (void)verifyCodeViewDidClickSend:(ZZVerificationCodeView *)v;

@end

NS_ASSUME_NONNULL_END

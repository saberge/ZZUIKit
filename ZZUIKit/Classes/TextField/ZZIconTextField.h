//
//  ZZIconTextField.h
//  AFNetworking
//
//  Created by laixian on 2019/10/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZIconTextField : UIView

@property (nonatomic ,strong ,readonly) UIImageView *leftIcon;
@property (nonatomic ,strong ,readonly) UITextField *textField;

@property (nonatomic ,assign) CGSize leftIconSize;
@property (nonatomic ,strong) UIColor *placeHolderColor;

@end

NS_ASSUME_NONNULL_END

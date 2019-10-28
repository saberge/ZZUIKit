//
//  ZZTitleTextField.h
//  AFNetworking
//
//  Created by laixian on 2019/10/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZTitleTextField : UIView

@property (nonatomic ,strong ,readonly) UILabel *left;
@property (nonatomic ,strong ,readonly) UITextField *textField;

/**
  default is 80
 */
@property (nonatomic ,assign) NSInteger leftWidth;

@end

NS_ASSUME_NONNULL_END

//
//  ZZBaseViewController.h
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import <UIKit/UIKit.h>
#import <ZZFoundation/ZZLocalized.h>
#import "UIView+Toast.h"
#import <ZZNetwork/ZZNetwork.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <ZZFoundation/ZZMarcs.h>
#import "TPKeyboardAvoidingScrollView.h"
#import "ZZNavigationBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZZBaseViewController : UIViewController

@property (nonatomic ,strong ,readonly) ZZNavigationBar *navigationBar;
@property (nonatomic ,strong ,readonly) UIView *contentView;

- (void)localizedChangde:(NSNotification *)noti;

- (void)display;

@end

NS_ASSUME_NONNULL_END

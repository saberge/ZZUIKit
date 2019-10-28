//
//  ZZPageViewController.h
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import "ZZBaseViewController.h"
#import <DJTableViewVM/DJTableViewVM.h>

NS_ASSUME_NONNULL_BEGIN

/**
*/
@interface ZZPageViewController : ZZBaseViewController

@property (nonatomic ,strong ,readonly) DJTableViewVM *tableViewVM;

- (void)beginRefresh;
- (void)endRefresh;
- (void)reload;
- (void)pullDownCallback;

@end

NS_ASSUME_NONNULL_END

//
//  ZZBaseViewController.m
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import "ZZBaseViewController.h"
#import <ZZFoundation/ZZLocalized.h>
#import <ZZCategory/UIColor+ZZ.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface ZZBaseViewController ()
@property (nonatomic ,strong ,readwrite) ZZNavigationBar *navigationBar;
@property (nonatomic ,strong ,readwrite) UIView *contentView;

@end

@implementation ZZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    [self baseBuildUI];
    [self baseAddObserver];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localizedChangde:) name:ZZLocalizedDidChangdeNoti object:nil];
    [self display];
}

- (void)baseBuildUI
{
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.contentView];
    [self.navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.equalTo(self.navigationBar.mas_bottom).offset(0);
    }];
}

- (void)baseAddObserver
{
    zzweakify(self)
    [RACObserve(self.navigationBar, hidden) subscribeNext:^(id  _Nullable x) {
        zzstrongify(self)
        BOOL hidden = [x boolValue];
        NSInteger height = hidden?0:64;
        [self.navigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)localizedChangde:(NSNotification *)noti
{
    [self display];
}

- (void)display
{
    
}

#pragma mark *********** lazy *********
- (ZZNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [ZZNavigationBar new];
        _navigationBar.backgroundColor = [UIColor colorWithHexStr:@"#161616"];
    }
    return _navigationBar;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor colorWithHexStr:@"#161616"];
    }
    return _contentView;
}
@end

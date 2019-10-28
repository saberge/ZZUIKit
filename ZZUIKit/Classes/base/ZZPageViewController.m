//
//  ZZPageViewController.m
//  AFNetworking
//
//  Created by laixian on 2019/10/9.
//

#import "ZZPageViewController.h"
#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>

@interface ZZPageViewController ()
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong ,readwrite) DJTableViewVM *tableViewVM;
@end

@implementation ZZPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
}

- (void)buildUI
{
    [self.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownCallback)];
}

- (void)reload
{
    [self.tableViewVM reloadData];
}

- (void)pullDownCallback
{
    
}

- (void)beginRefresh
{
    [self.tableView.mj_header beginRefreshing];
}

- (void)endRefresh
{
    [self.tableView.mj_header endRefreshing];
}

#pragma mark *********** lazy *********
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = UIColor.clearColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (DJTableViewVM *)tableViewVM
{
    if (!_tableViewVM) {
        _tableViewVM = [[DJTableViewVM alloc]initWithTableView:self.tableView delegate:self];
    }
    return _tableViewVM;
}
@end

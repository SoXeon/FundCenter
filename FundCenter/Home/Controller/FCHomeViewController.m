//
//  FCHomeViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCHomeViewController.h"
#import "FCAccountTool.h"
#import "FCFocusViewController.h"
#import "StockTrendViewController.h"
#import "AppDelegate.h"

#define kItemSizeW 300

@interface FCHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UICollectionView *topCollectionView;
@property (nonatomic, strong) UITableView *bottomTableView;

@end

@implementation FCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor colorWithHexString:@"EBEBEB"];
    
    [self setNav];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kItemSizeW + 74, kItemSizeW);
    layout.minimumInteritemSpacing = 20;
    
    self.topCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, XWScreenWitdh, 730) collectionViewLayout: layout];
    self.topCollectionView.backgroundColor = [UIColor clearColor];
    self.topCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    [self.topCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionItem"];
    self.topCollectionView.delegate = self;
    self.topCollectionView.dataSource = self;
    [self.view addSubview:self.topCollectionView];
    
    self.bottomTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topCollectionView.frame) - 50, XWScreenWitdh, XWScreenHeight - 730)];
    self.bottomTableView.backgroundColor = [UIColor clearColor];
    self.bottomTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.bottomTableView.scrollEnabled = NO;
    self.bottomTableView.delegate = self;
    self.bottomTableView.dataSource = self;
    [self.view addSubview:self.bottomTableView];
    
}

- (void)setNav
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:[FCAccountTool sharedFCAccountTool].currentAccount.name style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_icon_IM"] style:UIBarButtonItemStyleBordered target:self action:@selector(refreshContent)];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchItem)];
    
    self.navigationItem.rightBarButtonItems = @[searchItem,refreshItem];
}

- (void)refreshContent
{
    
}

- (void)searchItem
{
    
}

#pragma mark tableView Delegate & DataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableviewItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        
        switch (indexPath.row) {
            case 0:
            {
                
                cell.textLabel.text = @"其他市场";
                cell.imageView.image = [UIImage imageNamed:@"icon_tool_Blob"];

            }
                break;
            case 1:
            {
                cell.textLabel.text = @"实时资讯";
                cell.imageView.image = [UIImage imageNamed:@"icon_tool_ling"];

            }
                break;
            case 2:
            {
                cell.textLabel.text = @"决策案例";
                 cell.imageView.image = [UIImage imageNamed:@"icon_tool_chart"];
            }
                break;
            default:
                break;
        }
        
    }
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

#pragma mark collectionView Delegate & DataSource & layout
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            FCFocusViewController *focus = [FCFocusViewController new];
            [self presentViewController:focus animated:YES completion:nil];
        }
            break;
            case 1:
        {
            AppDelegate *deleagte =  (AppDelegate *)[UIApplication sharedApplication].delegate;
            deleagte.tabBarVC.selectedIndex = 2;
        }
            break;
            case 2:
        {
            StockTrendViewController *stockTrend = [StockTrendViewController new];
            [self.navigationController pushViewController:stockTrend animated:YES];
            AppDelegate *deleagte =  (AppDelegate *)[UIApplication sharedApplication].delegate;
            deleagte.tabBarVC.tabBarHidden = YES;
        }
            break;
        case 3:
        {
            
        }
            break;
        default:
            break;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"collectionItem";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    switch (indexPath.item) {
        case 0:
        {
            UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            iconImageView.image = [UIImage imageNamed:@"icon_tool_search"];
            iconImageView.center = cell.contentView.center;
            
            [cell.contentView addSubview:iconImageView];
            
            UILabel *iconText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame), CGRectGetMaxY(iconImageView.frame), 100, 40)];
            iconText.text = @"关注领域";
            iconText.textAlignment = NSTextAlignmentCenter;
            iconText.centerX = iconImageView.centerX;
            
            [cell.contentView addSubview:iconText];
            
            
        }
            break;
            
        case 1:
        {
            UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            iconImageView.image = [UIImage imageNamed:@"icon_tool_claultor"];
            iconImageView.center = cell.contentView.center;
            
            [cell.contentView addSubview:iconImageView];
            
            UILabel *iconText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame), CGRectGetMaxY(iconImageView.frame), 100, 40)];
            iconText.text = @"我的持仓";
            iconText.textAlignment = NSTextAlignmentCenter;
            iconText.centerX = iconImageView.centerX;
            
            [cell.contentView addSubview:iconText];
        }
            break;
            
        case 2:
        {
            UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            iconImageView.image = [UIImage imageNamed:@"icon_tool_fire"];
            iconImageView.center = cell.contentView.center;
            
            [cell.contentView addSubview:iconImageView];
            
            UILabel *iconText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame), CGRectGetMaxY(iconImageView.frame), 100, 40)];
            iconText.text = @"大盘走势";
            iconText.textAlignment = NSTextAlignmentCenter;
            iconText.centerX = iconImageView.centerX;
            
            [cell.contentView addSubview:iconText];
        }
            break;
            
        case 3:
        {
            UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            iconImageView.image = [UIImage imageNamed:@"icon_tool_book"];
            iconImageView.center = cell.contentView.center;
            
            [cell.contentView addSubview:iconImageView];
            
            UILabel *iconText = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(iconImageView.frame), CGRectGetMaxY(iconImageView.frame), 100, 40)];
            iconText.text = @"涨跌排名";
            iconText.textAlignment = NSTextAlignmentCenter;
            iconText.centerX = iconImageView.centerX;
            
            [cell.contentView addSubview:iconText];
        }
            break;
            
        default:
            break;
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

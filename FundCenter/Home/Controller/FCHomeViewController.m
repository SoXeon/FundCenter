//
//  FCHomeViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCHomeViewController.h"

#define kItemSizeW 300

@interface FCHomeViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UICollectionView *topCollectionView;
@property (nonatomic, strong) UITableView *bottomTableView;

@end

@implementation FCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"home";
    
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
        cell.backgroundColor = XWRandomColor;
        
        switch (indexPath.row) {
            case 0:
            {
                
                cell.textLabel.text = @"其他市场";
            }
                break;
            case 1:
            {
                cell.textLabel.text = @"实时资讯";

            }
                break;
            case 2:
            {
                cell.textLabel.text = @"决策案例";
            }
                break;
            default:
                break;
        }
        
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

#pragma mark collectionView Delegate & DataSource & layout
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
            iconImageView.image = [UIImage imageNamed:@"kb_icon_tool_stock"];
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
            iconImageView.image = [UIImage imageNamed:@"kb_icon_tool_stock"];
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
            iconImageView.image = [UIImage imageNamed:@"kb_icon_tool_stock"];
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
            iconImageView.image = [UIImage imageNamed:@"kb_icon_tool_stock"];
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
    
    cell.backgroundColor = XWRandomColor;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

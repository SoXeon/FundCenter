//
//  SHTableViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "SHTableViewController.h"

@interface SHTableViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate>

#define kTopItemSizeW XWScreenWitdh * 0.5 - 12
#define kCollectionItemID @"collectionItemID"

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *firstTableViewItems;
@property (nonatomic, strong) NSArray *secondTableViewItems;
@property (nonatomic, strong) NSArray *collectionViewItems;


@end

@implementation SHTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionViewItems = @[
  @{@"part":@"计算机", @"limit":@"+7.81%", @"topFund":@"赛维智能", @"detailInfo":@"20.98+10.02%"},
  @{@"part":@"传媒", @"limit":@"+5.45%", @"topFund":@"鹏博士", @"detailInfo":@"36.02+8.07%"},
  @{@"part":@"建筑装饰", @"limit":@"+5.40%", @"topFund":@"龙云建设", @"detailInfo":@"40.02+10.07%"},
  @{@"part":@"通信", @"limit":@"+5.10%", @"topFund":@"世纪鼎立", @"detailInfo":@"32.02+8.07%"},
  @{@"part":@"电子", @"limit":@"+5.05%", @"topFund":@"利源信息", @"detailInfo":@"20.02+11.07%"},
  @{@"part":@"纺织服装", @"limit":@"+5.01%", @"topFund":@"蓝鼎控股", @"detailInfo":@"29.02+8.07%"}
  ];
    
    self.firstTableViewItems = @[
                            @{@"name":@"中信证券",@"hotNum":@"2559",@"isGood":@"yes"},
                            @{@"name":@"多伦股份",@"hotNum":@"1866",@"isGood":@"no"},
                            @{@"name":@"上证指数",@"hotNum":@"1806",@"isGood":@"yes"},
                            @{@"name":@"苏宁云商",@"hotNum":@"1716",@"isGood":@"yes"},
                            @{@"name":@"中国平安",@"hotNum":@"1555",@"isGood":@"yes"}];
    
    self.secondTableViewItems =  @[
                                   @{@"name":@"中信证券",@"hotNum":@"2552",@"isGood":@"no"},
                                   @{@"name":@"苏宁云商",@"hotNum":@"1686",@"isGood":@"no"},
                                   @{@"name":@"上证指数",@"hotNum":@"1320",@"isGood":@"no"},
                                   @{@"name":@"乐视网",@"hotNum":@"1223",@"isGood":@"no"},
                                   @{@"name":@"中国平安",@"hotNum":@"1102",@"isGood":@"yes"}];
    
    
    

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kTopItemSizeW, 100);
    layout.minimumInteritemSpacing = 5;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, XWScreenWitdh, 360) collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionItemID];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), XWScreenWitdh, 550) style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}


-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"沪深";
}

-(UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.frame = CGRectMake(0, 0, XWScreenWitdh, 44);
    
    UILabel *hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 44)];
    if (section == 0) {
        hotLabel.text = @"1小时内最热";
    } else {
        hotLabel.text = @"24小时内最热";
    }
    [headerView addSubview:hotLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *idIdentifier = @"tableviewItemOne";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
        centerLabel.centerX = self.view.centerX;
        NSString *isTop;
        
        if (indexPath.section == 0) {
            
            cell.textLabel.text = self.firstTableViewItems[indexPath.row][@"name"];
            
            centerLabel.text = self.firstTableViewItems[indexPath.row][@"hotNum"];
            
            isTop = self.firstTableViewItems[indexPath.row][@"isGood"];
            
        } else {
            
            cell.textLabel.text = self.secondTableViewItems[indexPath.row][@"name"];
            
            centerLabel.text = self.secondTableViewItems[indexPath.row][@"hotNum"];
            
            isTop = self.secondTableViewItems[indexPath.row][@"isGood"];
            
        }
        
        if ([isTop isEqualToString:@"yes"]) {
            centerLabel.textColor = [UIColor redColor];
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-up"]];
        } else {
            centerLabel.textColor = [UIColor greenColor];
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-down"]];
        }
        
        [cell.contentView addSubview:centerLabel];
        
    }
    
    return cell;
}


#pragma mark collectionView datasource & deleagate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionItemID forIndexPath:indexPath];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 13, 90, 80)];
    textView.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",self.collectionViewItems[indexPath.row][@"part"],
                     self.collectionViewItems[indexPath.row][@"limit"],self.collectionViewItems[indexPath.row][@"topFund"],self.collectionViewItems[indexPath.row][@"detailInfo"]];
    textView.userInteractionEnabled = NO;
    [cell.contentView addSubview:textView];
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.borderWidth = 1.0;
    cell.layer.masksToBounds = YES;
    
    return cell;
}
@end

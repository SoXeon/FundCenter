//
//  FCCollectionViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCCollectionViewController.h"
#import "JHAPISDK.h"
#import "JHOpenidSupplier.h"
#import "FundModel.h"
#import "MJRefresh.h"
#import "FCCollectionDetailViewController.h"
#import "TOWebViewController.h"

@interface FCCollectionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *fundsGroup;
@property (nonatomic, strong) NSMutableArray *fundsResults;
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) MJRefreshHeaderView *head;
@property (nonatomic, strong) NSArray *zjArrays;

@end

@implementation FCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"收藏";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

//    [self addRefreshViews];
    
    self.zjArrays = @[
  @{@"zjName":@"易方达双债增强A",@"openURL":@"http://www.efunds.com.cn/html/fund/110017_fundinfo.htm"},
  @{@"zjName":@"易方达双债增强B",@"openURL":@"http://www.efunds.com.cn/html/fund/110018_fundinfo.htm"},
  @{@"zjName":@"易方达双债增强C",@"openURL":@"http://www.efunds.com.cn/html/fund/110036_fundinfo.htm"}];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.head beginRefreshing];
}

- (void)addRefreshViews
{
    __weak typeof(&*self) weakSelf = self;

    _head = [MJRefreshHeaderView header];
    _head.scrollView = self.tableView;
    [_head beginRefreshingBlock];
    _head.beginRefreshingBlock = ^(MJRefreshBaseView * refreshView) {
        
        __strong typeof(&*self) strongSelf = weakSelf;

        if (strongSelf) {
            [strongSelf loadNewData];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [strongSelf.tableView reloadData];
            });
            
        }

    };
}

- (void)loadNewData
{
    self.fundsResults = [NSMutableArray array];
    
    //,@"sh600570",@"sh600637",@"sh600325",@"sh600638"
    self.fundsGroup = @[@"BABA", @"sh600637"];
    
    for (int i = 0; i < self.fundsGroup.count; i++) {
        
        if (i == 0) {
           // [self fetchFundInfoWithID:_fundsGroup[i] fundType:@"usa"];
        } else {
           // [self fetchFundInfoWithID:_fundsGroup[i] fundType:@"hs"];
            
        }
        
    }
}

- (void)fetchFundInfoWithID:(NSString *)gid fundType:(NSString *)fundType
{
    NSMutableArray *tempArray = [NSMutableArray array];
    
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JHc834a56dd81afa19b928c4ae8e37f7f4"];
    
    NSString *path = [NSString stringWithFormat:@"http://web.juhe.cn:8080/finance/stock/%@", fundType];
    NSString *api_id = @"21";
    NSString *method = @"GET";
    NSDictionary *param = @{@"gid":gid,
                            @"dtype":@"json"};
    
    [[JHAPISDK shareJHAPISDK] executeWorkWithAPI:path APIID:api_id Parameters:param Method:method Success:^(id responseObject) {
        
        NSArray *results = responseObject[@"result"];
        
        for (NSDictionary *fundItem in results) {
            
            
            if ([fundType isEqualToString:@"usa"]) {
                usaFundModel *detailModel = [[usaFundModel alloc] initWithDict:fundItem[@"data"]];
                usaGopictureModel *usaUrlData = [[usaGopictureModel alloc] initWithDict:fundItem[@"gopicture"]];
                
                [tempArray addObject:detailModel];
                [tempArray addObject:usaUrlData];
                
            } else {
                
                FundModel *detailModel = [[FundModel alloc] initWithDict:fundItem[@"data"]];
                dapandModel *dapandData = [[dapandModel alloc] initWithDict:fundItem[@"dapandata"]];
                gopictureModel *urlData = [[gopictureModel alloc] initWithDict:fundItem[@"gopicture"]];
                
                [tempArray addObject:detailModel];
                [tempArray addObject:dapandData];
                [tempArray addObject:urlData];
 
            }
            
        }
        
        [self.fundsResults addObject:tempArray];
        [self.tableView reloadData];
        [self.head endRefreshing];
    } Failure:^(NSError *error) {
        NSLog(@"%@ error", error.description);
    }];

    
}

#pragma mark tableView Delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return self.fundsResults.count;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableviewItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor grayColor];
        
        NSString *limitString;
        NSString *currentPriString;
        
        switch (indexPath.section) {
            case 0:
            {
                cell.textLabel.text = (NSString*)self.zjArrays[indexPath.row][@"zjName"];
                
            }
                break;
            case 1:
            {
                if (indexPath.row == 0) {
                    usaFundModel *usaFundData = (usaFundModel *)self.fundsResults[indexPath.row][0];
                    cell.textLabel.text = usaFundData.name;
                    cell.detailTextLabel.text = usaFundData.gid;
                    limitString = usaFundData.limit;
                    currentPriString = usaFundData.lastestpri;
                    
                } else {
                    FundModel *fundData = (FundModel *)self.fundsResults[indexPath.row][0];
                    cell.textLabel.text = fundData.name;
                    cell.detailTextLabel.text = fundData.gid;
                    currentPriString = fundData.nowPri;
                    
                    dapandModel *dapandInfo = (dapandModel *)self.fundsResults[indexPath.row][1];
                    limitString = dapandInfo.rate;
                }
                
                UILabel *currentLimit = [[UILabel alloc] initWithFrame:CGRectMake(XWScreenWitdh - 130, 1, 100, 42)];
                currentLimit.text = [NSString stringWithFormat:@"%@%%",limitString];
                currentLimit.font = [UIFont systemFontOfSize:18.0];
                currentLimit.textColor = [UIColor whiteColor];
                currentLimit.textAlignment = NSTextAlignmentCenter;
                currentLimit.layer.cornerRadius = 5.0;
                currentLimit.layer.masksToBounds = YES;
                
                
                if ([limitString floatValue] > 0.00) {
                    currentLimit.backgroundColor = [UIColor redColor];
                } else {
                    currentLimit.backgroundColor = [UIColor greenColor];
                }
                
                [cell.contentView addSubview:currentLimit];
                
                UILabel *currentPri = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(currentLimit.frame) - 100, 0, 100, 44)];
                currentPri.text = currentPriString;
                currentPri.font = [UIFont systemFontOfSize:15.0];
                currentPri.textAlignment = NSTextAlignmentCenter;
                [cell.contentView addSubview:currentPri];

            }
                break;
            default:
                break;
        }
        
        
    }
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.section) {
        case 0:
        {
            TOWebViewController *webVC = [[TOWebViewController alloc]initWithURL:[NSURL URLWithString:self.zjArrays[indexPath.row][@"openURL"]]];
            
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:webVC] animated:YES completion:^{
                
            }];
        }
            break;
        case 1:
        {
            FCCollectionDetailViewController *collectionDetailVC = [[FCCollectionDetailViewController alloc] init];
            collectionDetailVC.detailInfo = self.fundsResults[indexPath.row];
            if (indexPath.row == 0) {
                collectionDetailVC.isUSA = YES;
            } else {
                collectionDetailVC.isUSA = NO;
            }
            [self presentViewController:collectionDetailVC animated:YES completion:nil];

        }
            break;
        default:
            break;
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *headerView = [UIView new];
        headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        headerView.frame = CGRectMake(0, 0, XWScreenWitdh, 44);
        [headerView setBackgroundColor:[UIColor whiteColor]];
        
        UILabel *allLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        allLabel.text = @"全部";
        allLabel.textAlignment = NSTextAlignmentCenter;
        allLabel.textColor = [UIColor colorWithHexString:@"2686D8"];
        [headerView addSubview:allLabel];
        
        UILabel *currentLimit = [[UILabel alloc] initWithFrame:CGRectMake(XWScreenWitdh - 100 - 30, 0, 100, 44)];
        currentLimit.textColor = [UIColor colorWithHexString:@"2686D8"];
        currentLimit.text = @"涨跌幅";
        currentLimit.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:currentLimit];
        
        UILabel *currentPri = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(currentLimit.frame) - 100, 0, 100, 44)];
        currentPri.text = @"当前价";
        currentPri.textColor = [UIColor colorWithHexString:@"2686D8"];
        currentPri.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:currentPri];
        return headerView;

    } else {
        UIView *headerView = [UIView new];
        headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        headerView.frame = CGRectMake(0, 0, XWScreenWitdh, 88);
        [headerView setBackgroundColor:[UIColor whiteColor]];
        
        UIImageView *currentBigDataImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, XWScreenWitdh, 44 * 2)];
        currentBigDataImageView.image = [UIImage imageNamed:@"currentBigData"];
        currentBigDataImageView.contentMode = UIViewContentModeScaleToFill;
        [headerView addSubview:currentBigDataImageView];
        
        return headerView;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 44;
    } else {
        return 88;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

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

@interface FCCollectionViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *fundsGroup;
@property (nonatomic, strong) NSMutableArray *fundsResults;
@property (nonatomic, strong) UITableView *tableView;
@property (strong, nonatomic) MJRefreshHeaderView *head;


@end

@implementation FCCollectionViewController

- (NSArray *)fundsGroup
{
    if (_fundsGroup == nil) {
        //,@"sh600570",@"sh600637",@"sh600325",@"sh600638"
        _fundsGroup = @[@"BABA"];
    }
    return _fundsGroup;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"收藏";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

    [self addRefreshViews];
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
    self.fundsGroup = @[@"BABA"];
    
    for (int i = 0; i < self.fundsGroup.count; i++) {
        
        if (i == 0) {
            [self fetchFundInfoWithID:_fundsGroup[i] fundType:@"usa"];
        } else {
            [self fetchFundInfoWithID:_fundsGroup[i] fundType:@"hs"];
            
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fundsResults.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableviewItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        
        NSString *limitString;
        NSString *currentPriString;
        
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
        
        UILabel *currentLimit = [[UILabel alloc] initWithFrame:CGRectMake(XWScreenWitdh - 130, 0, 100, 44)];
        currentLimit.text = limitString;
        currentLimit.textAlignment = NSTextAlignmentCenter;
        
        if ([limitString integerValue] > 0) {
            currentLimit.backgroundColor = [UIColor redColor];
        } else {
            currentLimit.backgroundColor = [UIColor greenColor];
        }
        
        [cell.contentView addSubview:currentLimit];
        
        UILabel *currentPri = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(currentLimit.frame) - 100, 0, 100, 44)];
        currentPri.text = currentPriString;
        currentPri.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:currentPri];
        
    }
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

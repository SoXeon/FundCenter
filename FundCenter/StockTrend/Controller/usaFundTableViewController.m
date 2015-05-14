//
//  usaFundTableViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "usaFundTableViewController.h"

@interface usaFundTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *firstTableViewItems;
@property (nonatomic, strong) NSArray *secondTableViewItems;
@property (nonatomic, strong) NSArray *thirdTableViewItems;

@end

@implementation usaFundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTableViewItems = @[@{@"name":@"阿里巴巴",@"hotNum":@"255",@"isGood":@"yes"},
        @{@"name":@"苹果",@"hotNum":@"157",@"isGood":@"yes"},
        @{@"name":@"道琼斯指数",@"hotNum":@"146",@"isGood":@"yes"},
        @{@"name":@"奇虎360",@"hotNum":@"130",@"isGood":@"yes"},
        @{@"name":@"聚美优品",@"hotNum":@"119",@"isGood":@"yes"}];
    
    self.secondTableViewItems = @[@{@"name":@"阿里巴巴",@"hotNum":@"4286",@"isGood":@"no"},
                                  @{@"name":@"苹果",@"hotNum":@"3366",@"isGood":@"no"},
                                  @{@"name":@"道琼斯指数",@"hotNum":@"2168",@"isGood":@"no"},
                                  @{@"name":@"奇虎360",@"hotNum":@"2004",@"isGood":@"no"},
                                  @{@"name":@"京东",@"hotNum":@"1942",@"isGood":@"no"}];
    
    self.thirdTableViewItems = @[@{@"name":@"河南鸽瑞",@"nowPri":@"2.79",@"upPer":@"+52.46%"},
        @{@"name":@"橡果国际",@"nowPri":@"1.75",@"upPer":@"+27.68%"},
        @{@"name":@"豪鹏国际",@"nowPri":@"1.27",@"upPer":@"+20.36%"},
        @{@"name":@"阿特斯太阳能",@"nowPri":@"4.49",@"upPer":@"+11.26%"},
        @{@"name":@"兴达集团",@"nowPri":@"8.79",@"upPer":@"+8.42%"}
                                 ];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 66, XWScreenWitdh, XWScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}


-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"美股";
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.frame = CGRectMake(0, 0, XWScreenWitdh, 44);
    
    UILabel *hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 44)];
    if (section == 0) {
        hotLabel.text = @"1小时内最热";
    } else if (section == 1){
        hotLabel.text = @"24小时内最热";
    } else if (section == 2) {
        hotLabel.text = @"中概念涨幅榜";
    }
    [headerView addSubview:hotLabel];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idIdentifier = @"tableviewItemOne";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        
        NSString *firtText;
        NSString *secondText;
        NSString *lastText;
        
        switch (indexPath.section) {
            case 0:
            {
                firtText = self.firstTableViewItems[indexPath.row][@"name"];
                secondText = self.firstTableViewItems[indexPath.row][@"hotNum"];
                lastText = self.firstTableViewItems[indexPath.row][@"isGood"];
            }
                break;
            case 1:
            {
                firtText = self.secondTableViewItems[indexPath.row][@"name"];
                secondText = self.secondTableViewItems[indexPath.row][@"hotNum"];
                lastText = self.secondTableViewItems[indexPath.row][@"isGood"];

            }
                break;
                case 2:
            {
                firtText = self.thirdTableViewItems[indexPath.row][@"name"];
                secondText = self.thirdTableViewItems[indexPath.row][@"nowPri"];
                lastText = self.thirdTableViewItems[indexPath.row][@"upPer"];
            }
                break;
            default:
                break;
        }
        
        cell.textLabel.text = firtText;
        
        UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
        centerLabel.centerX = XWScreenWitdh * 0.5;
        centerLabel.text = secondText;

        
        UILabel *lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(XWScreenWitdh - 150, 0, 150, 44)];
        
        if ([lastText isEqualToString:@"yes"]) {
            centerLabel.textColor = [UIColor redColor];
                        cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-up"]];
        } else if ([lastText isEqualToString:@"no"]) {
            centerLabel.textColor = [UIColor greenColor];
            cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-down"]];
        } else {
            lastLabel.text = lastText;
            lastLabel.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:lastLabel];
        }
        
        [cell.contentView addSubview:centerLabel];
        
    }
    return cell;
}
@end

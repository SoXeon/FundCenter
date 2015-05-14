//
//  FundTableViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FundTableViewController.h"

@interface FundTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *firstTableViewItems;
@property (nonatomic, strong) NSArray *secondTableViewItems;
@property (nonatomic, strong) NSArray *thirdTableViewItems;

@end

@implementation FundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.firstTableViewItems =  @[@{@"name":@"基金科瑞",@"nowPri":@"1.79",@"upPer":@"+2.46%"},
                                  @{@"name":@"基金云丰",@"nowPri":@"1.45",@"upPer":@"+1.68%"},
                                  @{@"name":@"基金久嘉",@"nowPri":@"1.27",@"upPer":@"+1.36%"},
                                  @{@"name":@"基金丰和",@"nowPri":@"1.19",@"upPer":@"+1.26%"},
                                  @{@"name":@"基金弘扬",@"nowPri":@"1.09",@"upPer":@"+1.02%"}
                                  ];
    
    self.secondTableViewItems = @[@{@"name":@"银华日立",@"money":@"101.6330",@"nianhua":@"109.15%"},
                                  @{@"name":@"安心金礼",@"money":@"88.6330",@"nianhua":@"89.24%"},@{@"name":@"国金通用",@"money":@"19.30",@"nianhua":@"69.32%"},@{@"name":@"南方现金",@"money":@"1.6240",@"nianhua":@"52.12%"},@{@"name":@"股华上立",@"money":@"1.1330",@"nianhua":@"6.15%"}];
    

    self.thirdTableViewItems = @[@{@"name":@"健康B",@"nowPri":@"1.10",@"upPer":@"+10.46%"},
                                 @{@"name":@"传媒B",@"nowPri":@"1.38",@"upPer":@"+10.38%"},
                                 @{@"name":@"互联网B",@"nowPri":@"1.27",@"upPer":@"+10.11%"},
                                 @{@"name":@"TMT中证B",@"nowPri":@"1.19",@"upPer":@"+10.06%"},
                                 @{@"name":@"创业板B",@"nowPri":@"1.09",@"upPer":@"+10.02%"}
                                 ];

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 66, XWScreenWitdh, XWScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"基金";
}

-(UIColor *)colorForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return [UIColor whiteColor];
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
        hotLabel.text = @"封闭型";
    } else if (section == 1){
        hotLabel.text = @"货币型";
    } else if (section == 2) {
        hotLabel.text = @"开放式基金";
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
                secondText = self.firstTableViewItems[indexPath.row][@"nowPri"];
                lastText = self.firstTableViewItems[indexPath.row][@"upPer"];
            }
                break;
            case 1:
            {
                firtText = self.secondTableViewItems[indexPath.row][@"name"];
                secondText = self.secondTableViewItems[indexPath.row][@"money"];
                lastText = self.secondTableViewItems[indexPath.row][@"nianhua"];
                
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

            lastLabel.text = lastText;
            lastLabel.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:lastLabel];
        
        [cell.contentView addSubview:centerLabel];
    }
    return cell;
}
@end

//
//  BTBITableViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "BTBITableViewController.h"

@interface BTBITableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *bitBiArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BTBITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.bitBiArray = @[@{@"name":@"比特币人民币",@"currentPri":@"1509.18",@"changeNumber":@"8.45万"},
                        @{@"name":@"比特币美元",@"currentPri":@"243.522",@"changeNumber":@"5777.34"},
                        @{@"name":@"比特币欧元",@"currentPri":@"241.16",@"changeNumber":@"257.56"},
                        @{@"name":@"比特币英镑",@"currentPri":@"168.82",@"changeNumber":@"336.03"},
                        @{@"name":@"比特币澳元",@"currentPri":@"339.28",@"changeNumber":@"67.93"}];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, XWScreenWitdh, XWScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    headerView.frame = CGRectMake(0, 0, XWScreenWitdh, 35);
    
    UILabel *hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 35)];
    hotLabel.text = @"名称";
    hotLabel.textAlignment = NSTextAlignmentCenter;
    hotLabel.textColor = [UIColor grayColor];
    [headerView addSubview:hotLabel];
    
    UILabel *currentPri = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(hotLabel.frame)+ 100 + 50, 0, 150, 35)];
    currentPri.text = @"最新成交价";
    currentPri.textColor = [UIColor grayColor];
    currentPri.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:currentPri];
    
    UILabel *lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(XWScreenWitdh - 170, 0, 150, 35)];
    lastLabel.text = @"成交量";
    lastLabel.textColor = [UIColor grayColor];
    [headerView addSubview:lastLabel];
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}



-(NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"比特币";
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
    return self.bitBiArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *idIdentifier = @"tableviewItemOne";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idIdentifier];
        cell.backgroundColor = [UIColor whiteColor];
        
        UILabel *centerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
        centerLabel.centerX = XWScreenWitdh * 0.5;
        
        UILabel *lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
        
        cell.textLabel.text = self.bitBiArray[indexPath.section][@"name"];
        centerLabel.text = self.bitBiArray[indexPath.section][@"currentPri"];
        lastLabel.text = self.bitBiArray[indexPath.section][@"changeNumber"];
        
        [cell.contentView addSubview:centerLabel];
        
        cell.accessoryView = lastLabel;
    }
    
    return cell;
}



@end

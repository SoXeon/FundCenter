//
//  FundTableViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FundTableViewController.h"

@interface FundTableViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FundTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"fundtableview";
    
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


@end

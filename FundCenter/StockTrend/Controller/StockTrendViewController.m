//
//  StockTrendViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "StockTrendViewController.h"
#import "SHTableViewController.h"
#import "BTBITableViewController.h"
#import "usaFundTableViewController.h"
#import "FundTableViewController.h"
#import "AppDelegate.h"

@interface StockTrendViewController ()

@end

@implementation StockTrendViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate *deleagte =  (AppDelegate *)[UIApplication sharedApplication].delegate;
    deleagte.tabBarVC.tabBarHidden = NO;

}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    SHTableViewController *shtableViewController = [[SHTableViewController alloc] initWithStyle:UITableViewStylePlain];
    BTBITableViewController *bitVIewController = [[BTBITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    usaFundTableViewController *usaViewController = [[usaFundTableViewController alloc] initWithStyle:UITableViewStylePlain];
    FundTableViewController *fundtableViewController = [[FundTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    return @[shtableViewController, bitVIewController, usaViewController, fundtableViewController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.skipIntermediateViewControllers = NO;
    self.segmentedControl.size = CGSizeMake(215, 26);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

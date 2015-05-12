//
//  FCMessageViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCMessageViewController.h"
#import "AddTalkViewController.h"

@interface FCMessageViewController () <UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *talkCellArray;
@property (nonatomic, strong) UIPopoverController *popover;

@end

@implementation FCMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_icon_IM"] style:UIBarButtonItemStylePlain target:self action:@selector(addTalk)];
    
    //TODO:参照GitHub有一哥们的WeChat
//    self.talkCellArray = [NSMutableArray array];
//    
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, XWScreenWitdh, XWScreenHeight)];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    
//    [self.view addSubview:self.tableView];

    AddTalkViewController *addTalkVC = [[AddTalkViewController alloc] init];
    
    _popover = [[UIPopoverController alloc] initWithContentViewController:addTalkVC];
    _popover.popoverContentSize = CGSizeMake(150, 44 * 3);
    _popover.backgroundColor = [UIColor blackColor];
    _popover.delegate = self;

}

- (void)addTalk
{
    [_popover presentPopoverFromRect:CGRectMake(XWScreenWitdh * 0.45, 0, XWScreenWitdh, 66) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

#pragma mark tableView DataSource & Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


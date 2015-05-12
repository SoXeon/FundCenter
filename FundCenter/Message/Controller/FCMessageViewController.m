//
//  FCMessageViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCMessageViewController.h"
#import "AddTalkViewController.h"
#import "RootViewController.h"
#import "RDVTabBarController.h"

@interface FCMessageViewController () <UITableViewDataSource, UITableViewDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *talkCellArray;
@property (nonatomic, strong) UIPopoverController *popover;

@end

@implementation FCMessageViewController

- (void)loadDataSource
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       NSMutableArray *dataSource = [[NSMutableArray alloc] initWithObjects:
                                     @"你关注的互联网金融刚有一笔新的交易",
                                     @"你好，我是公告小管家，以后将提醒你所有自选产品的新公告",
                                     @"你好，我是持仓盈亏小管家,你可以添加一些持仓产品",
                                     @"你好，欢迎使用雪球，如果在使用过程中遇到问题，请联系我",nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.talkCellArray = dataSource;
            [self.tableView reloadData];
        });
        
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_icon_IM"] style:UIBarButtonItemStylePlain target:self action:@selector(addTalk)];
    
    self.talkCellArray = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, XWScreenWitdh, XWScreenHeight)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    [self loadDataSource];

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0];
    }
    if (indexPath.row < self.talkCellArray.count) {
        {
            
            NSString *username;
            NSString *userIcon;
            
            switch (indexPath.row) {
                case 0:
                {
                    username = @"个股公告";
                    userIcon = @"";
                }
                    break;
                    case 1:
                {
                    username = @"雪球组合";
                    userIcon = @"";
                }
                    break;
                    case 2:
                {
                    username = @"持仓亏盈";
                    userIcon = @"";
                }
                    break;
                    case 3:
                {
                    username = @"小秘书";
                    userIcon = @"";
                }
                default:
                    break;
            }
            
            cell.textLabel.text = username;
            cell.detailTextLabel.text = self.talkCellArray[indexPath.row];
            cell.imageView.image = [UIImage imageNamed:userIcon];
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self enterCustomCellMessage];
}

- (void)enterNewsController
{
    UIViewController *newVC = [UIViewController new];
    [self.navigationController pushViewController:newVC animated:YES];
}

- (void)enterCustomCellMessage
{
    RootViewController *messageVC = [RootViewController new];
    
    [self.navigationController presentViewController:messageVC animated:YES completion:nil];
    
}

- (void)enterMessage
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


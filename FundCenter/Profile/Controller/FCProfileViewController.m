//
//  FCProfileViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCProfileViewController.h"
#import "FCAccountTool.h"

@interface FCProfileViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FCProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_icon_setting"] style:UIBarButtonItemStyleBordered target:self action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStyleBordered target:self action:nil];

    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= 0) {
        switch (section) {
            case 0:
                return 1;
                break;
            case 1:
                return 1;
                break;
            case 2:
                return 3;
                break;
            default:
                break;
        }

    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"tableviewItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor whiteColor];
        
        if (indexPath.section == 0) {
            
            UIImageView *profileIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userInfo"]];
            profileIconImageView.frame = CGRectMake(30, 30, 100, 100);
            
            [cell.contentView addSubview:profileIconImageView];
            
            UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(profileIconImageView.frame) + 20, CGRectGetMinY(profileIconImageView.frame) + 10, 100, 44)];
            username.text = [FCAccountTool sharedFCAccountTool].currentAccount.name;
            
            [cell.contentView addSubview:username];
            
            UILabel *sex = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(profileIconImageView.frame) + 20, CGRectGetMaxY(username.frame), 100, 44)];
            sex.text = @"保密";
            [cell.contentView addSubview:sex];
            
            UILabel *focusItem = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(username.frame) + 100, 0, 80, 44)];
            focusItem.centerY = profileIconImageView.centerY;
            focusItem.text = @"关注 10";
            [cell.contentView addSubview:focusItem];

            
            UILabel *talkItem = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
            talkItem.centerX = focusItem.centerX;
            talkItem.centerY = focusItem.centerY - 44 - 6;
            talkItem.text = @"讨论 1";
            [cell.contentView addSubview:talkItem];
            
            
            UILabel *followersItem = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
            followersItem.centerX = focusItem.centerX;
            followersItem.centerY = focusItem.centerY + 44 + 6;
            followersItem.text = @"粉丝 4";
            [cell.contentView addSubview:followersItem];
        }
        
        if (indexPath.section == 1) {
            cell.textLabel.text = @"我的证券账户";
            cell.imageView.image = [UIImage imageNamed:@"user-v1"];
        }
        
        if (indexPath.section == 2) {
            switch (indexPath.row) {
                case 0:
                {
                    
                    cell.textLabel.text = @"持仓盈亏";
                    cell.imageView.image = [UIImage imageNamed:@"user-v5"];
                    
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"我的组合";
                    cell.imageView.image = [UIImage imageNamed:@"icon_top"];
                    
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"雪球币";
                    cell.imageView.image = [UIImage imageNamed:@"user-v4"];
                }
                    break;
                default:
                    break;
            }

        }
        
    }
    
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow.png"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 150;
    } else {
        return 44;
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

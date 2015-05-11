//
//  FCLoginViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCLoginViewController.h"
#import "FCLoginDetailViewController.h"

@interface FCLoginViewController ()

@end

@implementation FCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithHexString:@"0461B9"];
    
    UIImageView *loginImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginImageView"]];
    loginImageView.frame = CGRectMake(0, 0, XWScreenWitdh, XWScreenHeight - 100);
    [self.view addSubview:loginImageView];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor colorWithHexString:@"0091F5"]];
    loginBtn.frame = CGRectMake(XWScreenWitdh * 0.5 - 25 - 325, CGRectGetMaxY(loginImageView.frame) + 20, 325, 44);
    [loginBtn addTarget:self action:@selector(showLoginVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    UIButton *useBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [useBtn setTitle:@"马上使用" forState:UIControlStateNormal];
    [useBtn setBackgroundColor:[UIColor colorWithHexString:@"34D93A"]];
    useBtn.frame = CGRectMake(XWScreenWitdh * 0.5 + 25, CGRectGetMaxY(loginImageView.frame) + 20, 325, 44);
    [useBtn addTarget:self action:@selector(showHomeVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:useBtn];
    
}

- (void)showLoginVC
{
    FCLoginDetailViewController *loginDetailVC = [FCLoginDetailViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginDetailVC];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self.view.window.rootViewController presentViewController:nav animated:YES completion:nil];
}

- (void)showHomeVC
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

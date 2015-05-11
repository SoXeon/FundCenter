//
//  FCLoginDetailViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCLoginDetailViewController.h"
#import "JVFloatLabeledTextField.h"
#import "FCAccount.h"
#import "FCAccountTool.h"

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "FCHomeViewController.h"
#import "FCMessageViewController.h"
#import "FCCollectionViewController.h"
#import "FCProfileViewController.h"

const static CGFloat kJVFieldFontSize = 16.0f;

const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface FCLoginDetailViewController () <UITextFieldDelegate>

@property (nonatomic, strong) JVFloatLabeledTextField *titleField;
@property (nonatomic, strong) JVFloatLabeledTextField *keywordField;
@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) RDVTabBarController *tabBarVC;

@end

@implementation FCLoginDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"登录";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"F0F0F0"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:nil action:@selector(registerNewUser)];
    
    UIColor *floatingLabelColor = [UIColor brownColor];
    
    JVFloatLabeledTextField *titleField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 44)];
    titleField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    titleField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"手机号码:", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    titleField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    titleField.floatingLabelTextColor = floatingLabelColor;
    titleField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:titleField];
    titleField.translatesAutoresizingMaskIntoConstraints = NO;
    titleField.keepBaseline = 1;
    titleField.backgroundColor = [UIColor whiteColor];
    titleField.delegate = self;
    self.titleField = titleField;
    self.titleField.tag = 33333;
    [titleField becomeFirstResponder];
    
    
    JVFloatLabeledTextField *keywordField = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleField.frame) + 10.0, self.view.frame.size.width, 44)];
    keywordField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    keywordField.font = [UIFont systemFontOfSize:kJVFieldFontSize];
    keywordField.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:NSLocalizedString(@"登录密码:", @"")
                                    attributes:@{NSForegroundColorAttributeName: [UIColor darkGrayColor]}];
    keywordField.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    keywordField.floatingLabelTextColor = floatingLabelColor;
    keywordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.view addSubview:keywordField];
    keywordField.keepBaseline = 1;
    keywordField.translatesAutoresizingMaskIntoConstraints = NO;
    keywordField.backgroundColor = [UIColor whiteColor];
    keywordField.delegate = self;
    self.keywordField = keywordField;
    self.keywordField.tag = 22222;
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    loginBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    loginBtn.frame = CGRectMake(10, CGRectGetMaxY(keywordField.frame) + 10.0, self.view.frame.size.width - 20, 44);
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
}

- (void)loginAction
{
    
    [self.titleField resignFirstResponder];
    [self.titleField resignFirstResponder];
    
    if ((self.titleField.text.length > 0) && (self.keywordField.text.length > 0)) {
        
        FCAccount *account = [FCAccount new];
        account.uid = [NSString stringWithFormat:@"%@+%@", self.titleField.text, self.keywordField.text];
        account.name = self.titleField.text;
        [[FCAccountTool sharedFCAccountTool] saveAccount:account];
        
        [self setupViewControllers];

    } else {
        self.loginBtn.enabled = NO;
    }
}

- (void)setupViewControllers
{
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:[FCHomeViewController new]];
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:[FCMessageViewController new]];
    
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:[FCCollectionViewController new]];
    
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:[FCProfileViewController new]];
    
    self.tabBarVC = [[RDVTabBarController alloc] init];
    [self.tabBarVC setViewControllers:@[firstNav, secondNav, thirdNav, fourthNav]];
    
    [self customizeTabBarForController:self.tabBarVC];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController
{
    
    //TODO:图标要替换掉
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third", @"second"];
    NSArray *tabBarItemTitles = @[@"首页", @"消息",@"收藏", @"我的"];
    
    NSInteger index = 0;
    
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        [item setTitle:tabBarItemTitles[index]];
        
        index++;
    }
    self.view.window.rootViewController = self.tabBarVC;
}

- (void)done
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)registerNewUser
{
    
}

#pragma mark textFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField.tag == 22222) {
        
        [FCUserDefaults setObject:textField.text forKey:FCUserKeyword];
        
    } else if (textField.tag == 33333){
        
        [FCUserDefaults setObject:textField.text forKey:FCUserPhoneNumber];

    }
    
    [textField resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

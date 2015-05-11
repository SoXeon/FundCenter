//
//  FCLoginDetailViewController.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCLoginDetailViewController.h"
#import "JVFloatLabeledTextField.h"

const static CGFloat kJVFieldFontSize = 16.0f;

const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;

@interface FCLoginDetailViewController () <UITextFieldDelegate>

@end

@implementation FCLoginDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    loginBtn.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    loginBtn.frame = CGRectMake(10, CGRectGetMaxY(keywordField.frame) + 10.0, self.view.frame.size.width - 20, 44);
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:loginBtn];
}

- (void)loginAction
{
    
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

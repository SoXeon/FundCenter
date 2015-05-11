//
//  FCAccountTool.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCAccountTool.h"

#define kFile   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation FCAccountTool

single_implementation(FCAccountTool)

- (id)init
{
    if (self = [super init]) {
        _currentAccount = [NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    }
    return self;
}

- (void)saveAccount:(FCAccount *)account
{
    _currentAccount = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kFile];
}
@end

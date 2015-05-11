//
//  FCAccountTool.h
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Single.h"
#import "FCAccount.h"

@interface FCAccountTool : NSObject

single_interface(FCAccountTool)

- (void)saveAccount:(FCAccount *)account;

@property (nonatomic, readonly) FCAccount *currentAccount;

@end

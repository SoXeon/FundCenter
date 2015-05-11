//
//  FCAccount.m
//  FundCenter
//
//  Created by DP on 15/5/11.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCAccount.h"

@implementation FCAccount


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

@end

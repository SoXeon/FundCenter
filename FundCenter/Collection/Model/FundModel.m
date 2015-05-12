//
//  FundModel.m
//  FundCenter
//
//  Created by DP on 15/5/12.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FundModel.h"

@implementation FundModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.gid = dict[@"gid"];
        self.name = dict[@"name"];
        self.todayStartPri = dict[@"todayStartPri"];
        self.yestodEndPri = dict[@"yestodEndPri"];
        self.nowPri = dict[@"nowPri"];
        self.todayMax = dict[@"todayMax"];
        self.todayMin = dict[@"todayMin"];
    }
    return self;
}

@end

@implementation usaFundModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.gid = dict[@"gid"];
        self.name = dict[@"name"];
        self.lastestpri = dict[@"lastestpri"];
        self.maxpri = dict[@"maxpri"];
        self.minpri = dict[@"minpri"];
        self.uppic = dict[@"uppic"];
        self.limit = dict[@"limit"];
        self.markValue = dict[@"markValue"];
        self.openpri = dict[@"openpri"];
        self.EPS = dict[@"EPS"];
        self.priearn = dict[@"priearn"];
        self.traAmount = dict[@"traAmount"];
    }
    return self;
}

@end

@implementation dapandModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.dot = dict[@"dot"];
        self.nowPic = dict[@"nowPic"];
        self.traNumber = dict[@"traNumber"];
        self.traAmount = dict[@"traAmount"];
        self.rate = dict[@"rate"];
    }
    return self;
}

@end

@implementation gopictureModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.minurl = dict[@"minurl"];
        self.dayurl = dict[@"dayurl"];
        self.weekurl = dict[@"weekurl"];
        self.monthurl = dict[@"monthurl"];
    }
    return self;
}

@end

@implementation usaGopictureModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.minurl = dict[@"minurl"];
        self.dayurl = dict[@"dayurl"];
        self.weekurl = dict[@"weekurl"];
        self.monthurl = dict[@"monthurl"];
        self.min_weekpic = dict[@"min_weekpic"];
    }
    return self;
}

@end

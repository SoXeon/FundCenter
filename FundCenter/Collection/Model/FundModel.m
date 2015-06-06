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
        self.gid = [dict safeValueForKey:@"gid"];
        self.name = [dict safeValueForKey:@"name"];
        self.todayStartPri = [dict safeValueForKey:@"todayStartPri"];
        self.yestodEndPri = [dict safeValueForKey:@"yestodEndPri"];
        self.nowPri = [dict safeValueForKey:@"nowPri"];
        self.todayMax = [dict safeValueForKey:@"todayMax"];
        self.todayMin = [dict safeValueForKey:@"todayMin"];
        self.date = [dict safeValueForKey:@"date"];
    }
    return self;
}

@end

@implementation usaFundModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.gid = [dict safeValueForKey:@"gid"];
        self.name = [dict safeValueForKey:@"name"];
        self.lastestpri = [dict safeValueForKey:@"lastestpri"];
        self.maxpri = [dict safeValueForKey:@"maxpri"];
        self.minpri = [dict safeValueForKey:@"minpri"];
        self.uppic = [dict safeValueForKey:@"uppic"];
        self.limit = [dict safeValueForKey:@"limit"];
        self.markValue = [dict safeValueForKey:@"markValue"];
        self.openpri = [dict safeValueForKey:@"openpri"];
        self.EPS = [dict safeValueForKey:@"EPS"];
        self.priearn = [dict safeValueForKey:@"priearn"];
        self.traAmount = [dict safeValueForKey:@"traAmount"];
        self.ustime = [dict safeValueForKey:@"dict"];
        self.formpri = [dict safeValueForKey:@"formpri"];
    }
    return self;
}

@end

@implementation dapandModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = [dict safeValueForKey:@"name"];
        self.dot = [dict safeValueForKey:@"dot"];
        self.nowPic = [dict safeValueForKey:@"nowPic"];
        self.traNumber = [dict safeValueForKey:@"traNumber"];
        self.traAmount = [dict safeValueForKey:@"traAmount"];
        self.rate = [dict safeValueForKey:@"rate"];
    }
    return self;
}

@end

@implementation gopictureModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.minurl = [dict safeValueForKey:@"minurl"];
        self.dayurl = [dict safeValueForKey:@"dayurl"];
        self.weekurl = [dict safeValueForKey:@"weekurl"];
        self.monthurl = [dict safeValueForKey:@"monthurl"];
    }
    return self;
}

@end

@implementation usaGopictureModel

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.minurl = [dict safeValueForKey:@"minurl"];
        self.dayurl = [dict safeValueForKey:@"dayurl"];
        self.weekurl = [dict safeValueForKey:@"weekurl"];
        self.monthurl = [dict safeValueForKey:@"monthurl"];
        self.min_weekpic = [dict safeValueForKey:@"min_weekpic"];
    }
    return self;
}

@end

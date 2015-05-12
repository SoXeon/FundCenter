//
//  FundModel.h
//  FundCenter
//
//  Created by DP on 15/5/12.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FundModel : NSObject

@property (nonatomic, copy) NSString *gid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *todayStartPri;
@property (nonatomic, copy) NSString *yestodEndPri;
@property (nonatomic, copy) NSString *nowPri;
@property (nonatomic, copy) NSString *todayMax;
@property (nonatomic, copy) NSString *todayMin;

- (id)initWithDict:(NSDictionary *)dict;

@end

@interface usaFundModel : NSObject

@property (nonatomic, copy) NSString *gid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *lastestpri;//最新股价
@property (nonatomic, copy) NSString *maxpri;//最高
@property (nonatomic, copy) NSString *minpri;//最低
@property (nonatomic, copy) NSString *uppic;//涨跌额
@property (nonatomic, copy) NSString *limit;//涨跌幅
@property (nonatomic, copy) NSString *markValue;//市值
@property (nonatomic, copy) NSString *openpri;//开盘价
@property (nonatomic, copy) NSString *EPS;//每股收益
@property (nonatomic, copy) NSString *priearn;//市盈率
@property (nonatomic, copy) NSString *traAmount;//成交量
- (id)initWithDict:(NSDictionary *)dict;


@end

@interface dapandModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dot;
@property (nonatomic, copy) NSString *nowPic;
@property (nonatomic, copy) NSString *traNumber;
@property (nonatomic, copy) NSString *rate;
@property (nonatomic, copy) NSString *traAmount;

- (id)initWithDict:(NSDictionary *)dict;

@end

@interface gopictureModel : NSObject

@property (nonatomic, copy) NSString *minurl;
@property (nonatomic, copy) NSString *dayurl;
@property (nonatomic, copy) NSString *weekurl;
@property (nonatomic, copy) NSString *monthurl;

- (id)initWithDict:(NSDictionary *)dict;

@end

@interface usaGopictureModel : NSObject

@property (nonatomic, copy) NSString *minurl;
@property (nonatomic, copy) NSString *dayurl;
@property (nonatomic, copy) NSString *weekurl;
@property (nonatomic, copy) NSString *monthurl;
@property (nonatomic, copy) NSString *min_weekpic;//5日线

- (id)initWithDict:(NSDictionary *)dict;


@end

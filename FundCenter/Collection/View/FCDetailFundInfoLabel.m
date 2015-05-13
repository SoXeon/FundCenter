//
//  FCDetailFundInfoLabel.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCDetailFundInfoLabel.h"

@implementation FCDetailFundInfoLabel

- (id)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        self.topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.5)];
        self.topLabel.textAlignment = NSTextAlignmentCenter;
        self.topLabel.font = [UIFont systemFontOfSize:12.0];
        self.topLabel.textColor = [UIColor grayColor];
        [self addSubview: self.topLabel];
        
        self.bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height * 0.5, self.frame.size.width, self.frame.size.height * 0.5)];
        self.bottomLabel.textAlignment = NSTextAlignmentCenter;
        self.bottomLabel.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:self.bottomLabel];
        
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.masksToBounds = YES;
        
    }
    return self;
}

@end

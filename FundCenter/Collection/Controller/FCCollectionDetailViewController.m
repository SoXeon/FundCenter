//
//  FCCollectionDetailViewController.m
//  FundCenter
//
//  Created by DP on 15/5/12.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCCollectionDetailViewController.h"
#import "FundModel.h"
#import "FCDetailFundInfoLabel.h"
#import "UIImageView+WebCache.h"
#import "PNChart.h"

@interface FCCollectionDetailViewController ()

@property (nonatomic, strong) UIImageView *gopictureData;
@property (strong, nonatomic) UIButton *closeTableViewBtn;


@end

@implementation FCCollectionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    
    if (self.isUSA) {
        usaFundModel *usaData = (usaFundModel *)self.detailInfo[0];
        self.title = usaData.name;
    } else {
        FundModel *nomarlData = (FundModel *)self.detailInfo[0];
        self.title = nomarlData.name;
    }
    
    [self setTopView];
    
    [self setBottomView];
    
    [self addAwesomeChart];
    
    self.closeTableViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeTableViewBtn setImage:[UIImage imageNamed:@"circle-cross"] forState:UIControlStateNormal];
    [self.closeTableViewBtn addTarget:self action:@selector(closeViewController) forControlEvents:UIControlEventTouchUpInside];
    self.closeTableViewBtn.frame = CGRectMake(XWScreenWitdh - 45, 20, 40, 40);
    [self.view addSubview:self.closeTableViewBtn];

}

- (void)addAwesomeChart
{
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(10, 740 + 20, XWScreenWitdh - 20, 230)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    UILabel * barChartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 30)];
    barChartLabel.text = @"Detail Info";
    barChartLabel.textColor = PNFreshGreen;
    barChartLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    barChartLabel.textAlignment = NSTextAlignmentCenter;
    
    PNChart * barChart = [[PNChart alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(barChartLabel.frame), SCREEN_WIDTH, 180.0)];
    barChart.backgroundColor = [UIColor clearColor];
    barChart.type = PNBarType;
    [barChart setXLabels:@[@"EPS",@"limit",@"uppic",@"beta",@"divident"]];
    
    [barChart setYValues:@[@"1",@"4",@"2",@"6",@"3"]];
    [barChart strokeChart];
    [baseView addSubview:barChartLabel];
    [baseView addSubview:barChart];
    
}

- (void)closeViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setTopView
{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(10, 20, XWScreenWitdh - 20, 300)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    UILabel *currentPri = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 200, 100)];
    currentPri.textColor = [UIColor redColor];
    currentPri.textAlignment = NSTextAlignmentCenter;
    currentPri.font = [UIFont systemFontOfSize:38.0];
    [baseView addSubview:currentPri];
    
    UILabel *currentLimit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(currentPri.frame), currentPri.centerY - 30, 50, 30)];
    currentLimit.textColor = [UIColor redColor];
    currentLimit.textAlignment = NSTextAlignmentCenter;
    currentLimit.font = [UIFont systemFontOfSize:10.0];
    [baseView addSubview:currentLimit];
    
    UILabel *currentUppic = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(currentPri.frame), currentPri.centerY, 50, 30)];
    currentUppic.textColor = [UIColor redColor];
    currentUppic.textAlignment = NSTextAlignmentCenter;
    currentUppic.font = [UIFont systemFontOfSize:10.0];
    [baseView addSubview:currentUppic];
    
    UILabel *updateTime = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(currentPri.frame), CGRectGetMaxY(currentPri.frame), 50, 30)];
    updateTime.textAlignment = NSTextAlignmentCenter;
    updateTime.textColor = [UIColor grayColor];
    [baseView addSubview:updateTime];
    
    int labelHeight = 44;
    int labelWidth = XWScreenWitdh / 4 - 1;
    FCDetailFundInfoLabel *todayKai = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(updateTime.frame), labelWidth, labelHeight)];
    todayKai.topLabel.text = @"今开";
    [baseView addSubview:todayKai];
    
    FCDetailFundInfoLabel *yesShou = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(todayKai.frame), CGRectGetMinY(todayKai.frame),labelWidth, labelHeight)];
    yesShou.topLabel.text = @"昨收";
    [baseView addSubview:yesShou];
    
    FCDetailFundInfoLabel *topPri = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(yesShou.frame), CGRectGetMinY(todayKai.frame), labelWidth, labelHeight)];
    topPri.topLabel.text = @"最高";
    [baseView addSubview:topPri];
    
    FCDetailFundInfoLabel *lowPri = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(topPri.frame), CGRectGetMinY(todayKai.frame), labelWidth, labelHeight)];
    lowPri.topLabel.text = @"最低";
    [baseView addSubview:lowPri];
    
    FCDetailFundInfoLabel *changeLang = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(todayKai.frame), labelWidth, labelHeight)];
    changeLang.topLabel.text = @"成交量";
    [baseView addSubview:changeLang];
    
    FCDetailFundInfoLabel *shiYingLiu = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(changeLang.frame), CGRectGetMinY(changeLang.frame), labelWidth, labelHeight)];
    shiYingLiu.topLabel.text = @"市盈率";
    [baseView addSubview:shiYingLiu];
    
    FCDetailFundInfoLabel *meigujingzichan = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(shiYingLiu.frame), CGRectGetMinY(changeLang.frame), labelWidth, labelHeight)];
    meigujingzichan.topLabel.text = @"每股净资产";
    [baseView addSubview:meigujingzichan];
    
    FCDetailFundInfoLabel *zongshizhi = [[FCDetailFundInfoLabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(meigujingzichan.frame), CGRectGetMinY(changeLang.frame), labelWidth, labelHeight)];
    zongshizhi.topLabel.text = @"总市值";
    [baseView addSubview:zongshizhi];

    if (self.isUSA) {
        
        usaFundModel *usaData = (usaFundModel *)self.detailInfo[0];
        currentPri.text = usaData.lastestpri;
        if ([usaData.limit floatValue] > 0.00) {
            currentLimit.text = [NSString stringWithFormat:@"+%@%%", usaData.limit];
            currentLimit.textColor = [UIColor redColor];
            currentPri.textColor = [UIColor redColor];
            currentUppic.textColor = [UIColor redColor];
        } else {
            currentLimit.text = [NSString stringWithFormat:@"-%@%%", usaData.limit];
            currentLimit.textColor = [UIColor greenColor];
            currentPri.textColor = [UIColor greenColor];
            currentUppic.textColor = [UIColor greenColor];

        }
        currentUppic.text = usaData.uppic;
        updateTime.text = usaData.ustime;
        
        todayKai.bottomLabel.text = usaData.openpri;
        yesShou.bottomLabel.text = usaData.formpri;
        topPri.bottomLabel.text = usaData.maxpri;
        lowPri.bottomLabel.text = usaData.minpri;
        
        changeLang.bottomLabel.text = usaData.traAmount;
        shiYingLiu.bottomLabel.text = usaData.priearn;
        meigujingzichan.bottomLabel.text = usaData.EPS;
        zongshizhi.bottomLabel.text = usaData.markValue;
        
    } else {
        FundModel *nomarlData = (FundModel *)self.detailInfo[0];
        dapandModel *dapandData = (dapandModel *)self.detailInfo[1];
        currentPri.text = nomarlData.nowPri;
        currentLimit.text = dapandData.rate;
        currentUppic.text = dapandData.dot;
        
        if ([dapandData.rate floatValue] > 0.00) {
            currentLimit.text = [NSString stringWithFormat:@"+%@%%", dapandData.rate];
            currentLimit.textColor = [UIColor redColor];
            currentPri.textColor = [UIColor redColor];
            currentUppic.textColor = [UIColor redColor];
        } else {
            currentLimit.text = [NSString stringWithFormat:@"-%@%%", dapandData.rate];
            currentLimit.textColor = [UIColor greenColor];
            currentPri.textColor = [UIColor greenColor];
            currentUppic.textColor = [UIColor greenColor];
            
        }
        
        todayKai.bottomLabel.text = nomarlData.todayStartPri;
        yesShou.bottomLabel.text = nomarlData.yestodEndPri;
        topPri.bottomLabel.text = nomarlData.todayMax;
        lowPri.bottomLabel.text = nomarlData.todayMin;
        
        changeLang.bottomLabel.text = dapandData.traNumber;
        shiYingLiu.bottomLabel.text = dapandData.dot;
        meigujingzichan.bottomLabel.text = @"--";
        zongshizhi.bottomLabel.text = @"--";
    }
}

- (void)setBottomView
{
    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(10, 320 + 20, XWScreenWitdh - 20, 400)];
    
    baseView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:baseView];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@" 分时 ",@" 5日 ",@" 日K ", @" 周K ", @" 月K "]];
    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 0;
    
    segment.frame = CGRectMake(0, 20, 300, 40);
    segment.centerX = baseView.centerX;
    
    [baseView addSubview:segment];
    
    self.gopictureData = [[UIImageView alloc] init];
    self.gopictureData.frame = CGRectMake(10, CGRectGetMaxY(segment.frame), 545, 300);
    self.gopictureData.centerX = segment.centerX;
    
    
    if(self.isUSA) {
        usaGopictureModel *gopictureData = (usaGopictureModel *)self.detailInfo[1];
        [self.gopictureData sd_setImageWithURL:[NSURL URLWithString:gopictureData.minurl] placeholderImage:[UIImage imageNamed:@"pictureHolder"] options:SDWebImageRetryFailed | SDWebImageLowPriority completed:nil];
    } else {
        gopictureModel *nomarlData = (gopictureModel *)self.detailInfo[2];
        [self.gopictureData sd_setImageWithURL:[NSURL URLWithString:nomarlData.minurl] placeholderImage:[UIImage imageNamed:@"pictureHolder"] options:SDWebImageRetryFailed | SDWebImageLowPriority completed:nil];
    }
    
    
    [baseView addSubview:self.gopictureData];

}

- (void)segmentChanged:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;
    
    if (self.isUSA) {
        usaGopictureModel *gopictureData = (usaGopictureModel *)self.detailInfo[1];
        
        NSArray *gopictureArray = @[gopictureData.minurl, gopictureData.min_weekpic, gopictureData.dayurl, gopictureData.weekurl, gopictureData.monthurl];
        
        [self.gopictureData sd_setImageWithURL:[NSURL URLWithString:gopictureArray[index]] placeholderImage:[UIImage imageNamed:@"pictureHolder"] options:SDWebImageRetryFailed | SDWebImageLowPriority completed:nil];
        
    } else {
        gopictureModel *gopicureData = (gopictureModel *)self.detailInfo[2];
        
        NSArray *nomarlArray = @[gopicureData.minurl, gopicureData.dayurl, gopicureData.dayurl, gopicureData.weekurl, gopicureData.monthurl];
        
        [self.gopictureData sd_setImageWithURL:[NSURL URLWithString:nomarlArray[index]] placeholderImage:[UIImage imageNamed:@"pictureHolder"] options:SDWebImageRetryFailed | SDWebImageLowPriority completed:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

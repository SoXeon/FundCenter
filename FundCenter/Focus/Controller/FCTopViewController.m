//
//  FCTopViewController.m
//  FundCenter
//
//  Created by DP on 15/5/14.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCTopViewController.h"
#import "PNChart.h"
#import "AppDelegate.h"

#define ARC4RANDOM_MAX 0x100000000


@interface FCTopViewController ()

@property (strong, nonatomic) UIScrollView *chartScrollView;

@property (nonatomic) PNScatterChart *scatterChart;

@end

@implementation FCTopViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    AppDelegate *deleagte =  (AppDelegate *)[UIApplication sharedApplication].delegate;
    deleagte.tabBarVC.tabBarHidden = NO;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.chartScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.chartScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chartScrollView];
    
    //Add LineChart
    UILabel * lineChartLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 66, SCREEN_WIDTH, 30)];
    lineChartLabel.text = @"最近12月大盘走势";
    lineChartLabel.textColor = PNRed;
    lineChartLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    lineChartLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lineChartLabel];
    
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineChartLabel.frame), SCREEN_WIDTH, 200.0)];
    lineChart.centerX = self.view.centerX;
    [lineChart setXLabels:@[@"1 ",@"2 ",@"3 ",@"4 ",@"5 ",@"6 ",@"7 ",@"8 ",@"9 ",@"10 ",@"11 ",@"12 "]];
    lineChart.yLabelFormat = @"%1.1f";
    // Line Chart No.1
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@60.1, @230.1, @112.4, @222.2, @202.2,@162.2, @136.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.inflexionPointStyle = PNLineChartPointStyleNone;
    data01.dataTitle = @"沪深";
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
    NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2, @68.1, @130.1, @123.4, @212.2, @182.2,@103,@102];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.dataTitle = @"港股";
    data02.inflexionPointStyle = PNLineChartPointStyleNone;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart No.2
    NSArray * data03Array = @[@99.1, @122.1, @24.4, @123.2, @156.2, @62.1, @132.1, @173.4, @210.2, @132.2,@123.2,@123.2];
    PNLineChartData *data03 = [PNLineChartData new];
    data03.color = PNStarYellow;
    data03.itemCount = lineChart.xLabels.count;
    data03.dataTitle = @"美股";
    data03.inflexionPointStyle = PNLineChartPointStyleNone;
    data03.getData = ^(NSUInteger index) {
        CGFloat yValue = [data03Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    lineChart.legendStyle = PNLegendItemStyleSerial;
    lineChart.chartData = @[data01, data02, data03];
    lineChart.showCoordinateAxis = YES;
    
    [lineChart strokeChart];
    
    [self.view addSubview:lineChart];
    
    
    UIView *legend = [lineChart getLegendWithMaxWidth:320];
    [legend setFrame:CGRectMake(XWScreenWitdh * 0.3 , CGRectGetMaxY(lineChart.frame), 200, 44)];
    legend.centerX = self.view.centerX;
    [self.view addSubview:legend];
    
    
    UILabel * hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(legend.frame), SCREEN_WIDTH, 30)];
    hotLabel.text = @"投资热度";
    hotLabel.textColor = PNFreshGreen;
    hotLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    hotLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:hotLabel];

    
    //pieChart
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:35 color:PNRed description:@"计算机"],
                       [PNPieChartDataItem dataItemWithValue:25 color:PNBlue description:@"传媒"],
                       [PNPieChartDataItem dataItemWithValue:18 color:PNGreen description:@"建筑装饰"],
                       [PNPieChartDataItem dataItemWithValue:13 color:PNYellow description:@"通讯"],
                       [PNPieChartDataItem dataItemWithValue:9 color:PNWeiboColor description:@"其他"]
                       ];

    
    PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(hotLabel.frame) + 10, 240.0, 240.0) items:items];
    pieChart.centerX = hotLabel.centerX;
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    [pieChart strokeChart];
    [self.view addSubview:pieChart];
    
    
    //For Scatter Chart
    
    UILabel * lastLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(pieChart.frame) + 20, SCREEN_WIDTH, 30)];
    lastLabel.text = @"股票涨跌幅";
    lastLabel.textColor = PNDarkBlue;
    lastLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:23.0];
    lastLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lastLabel];

    
    self.scatterChart = [[PNScatterChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /6.0 - 30, CGRectGetMaxY(lastLabel.frame), XWScreenWitdh - 100, 300)];
    //        self.scatterChart.yLabelFormat = @"xxx %1.1f";
    self.scatterChart.centerX = pieChart.centerX;
    
    [self.scatterChart setAxisXWithMinimumValue:20 andMaxValue:100 toTicks:6];
    [self.scatterChart setAxisYWithMinimumValue:30 andMaxValue:50 toTicks:5];
    [self.scatterChart setAxisXLabel:@[@"x1", @"x2", @"x3", @"x4", @"x5", @"x6"]];
    [self.scatterChart setAxisYLabel:@[@"y1", @"y2", @"y3", @"y4", @"y5"]];
    
    NSArray * scatterdata01Array = [self randomSetOfObjects];
    PNScatterChartData *scatterdata01 = [PNScatterChartData new];
    scatterdata01.strokeColor = PNGreen;
    scatterdata01.fillColor = PNFreshGreen;
    scatterdata01.size = 2;
    scatterdata01.itemCount = [[scatterdata01Array objectAtIndex:0] count];
    scatterdata01.inflexionPointStyle = PNScatterChartPointStyleCircle;
    __block NSMutableArray *XAr1 = [NSMutableArray arrayWithArray:[scatterdata01Array objectAtIndex:0]];
    __block NSMutableArray *YAr1 = [NSMutableArray arrayWithArray:[scatterdata01Array objectAtIndex:1]];
    
    scatterdata01.getData = ^(NSUInteger index) {
        CGFloat xValue = [[XAr1 objectAtIndex:index] floatValue];
        CGFloat yValue = [[YAr1 objectAtIndex:index] floatValue];
        return [PNScatterChartDataItem dataItemWithX:xValue AndWithY:yValue];
    };
    
    [self.scatterChart setup];
    self.scatterChart.chartData = @[scatterdata01];
    
    [self.view addSubview:self.scatterChart];
    
}

/* this function is used only for creating random points */
- (NSArray *) randomSetOfObjects{
    NSMutableArray *array = [NSMutableArray array];
    NSString *LabelFormat = @"%1.f";
    NSMutableArray *XAr = [NSMutableArray array];
    NSMutableArray *YAr = [NSMutableArray array];
    for (int i = 0; i < 25 ; i++) {
        [XAr addObject:[NSString stringWithFormat:LabelFormat,(((double)arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisX_maxValue - self.scatterChart.AxisX_minValue) + self.scatterChart.AxisX_minValue)]];
        [YAr addObject:[NSString stringWithFormat:LabelFormat,(((double)arc4random() / ARC4RANDOM_MAX) * (self.scatterChart.AxisY_maxValue - self.scatterChart.AxisY_minValue) + self.scatterChart.AxisY_minValue)]];
    }
    [array addObject:XAr];
    [array addObject:YAr];
    return (NSArray*) array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

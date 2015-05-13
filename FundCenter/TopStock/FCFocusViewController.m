//
//  FCFocusViewController.m
//  FundCenter
//
//  Created by DP on 15/5/13.
//  Copyright (c) 2015年 QXL&DP. All rights reserved.
//

#import "FCFocusViewController.h"

#define kCollectionItemSizeW XWScreenWitdh / 3 - 10
#define kCollectionID @"collectionID"

@interface FCFocusViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionview;

@property (nonatomic, strong) NSArray *topTitles;
@property (nonatomic, strong) NSArray *detailTitles;
@property (strong, nonatomic) UIButton *closeTableViewBtn;


@end

@implementation FCFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    self.topTitles = @[@"计算机",
                       @"传媒",
                       @"建筑装饰",
                       @"通信",
                       @"电子",
                       @"纺织服饰",
                       @"商业贸易",
                       @"轻工制造",
                       @"交通运输",
                       @"休闲服务",
                       @"电气设备",
                       @"机械设备",
                       @"医药生物",
                       @"钢铁",
                       @"家用电器",
                       @"建筑材料",
                       @"国防军工",
                       @"食品饮料",
                       @"农林牧渔",
                       @"化工",
                       @"公用事业",
                       @"房地产",
                       @"有色金属",
                       @"汽车",
                       @"采掘",
                       @"银行",
                       @"非银金融"];
    self.detailTitles = @[@"+7.81%",
                          @"+5.46%",
                          @"+4.03%",
                          @"+2.21%",
                          @"+3.44%",
                          @"+2.33%",
                          @"+8.81%",
                          @"+1.46%",
                          @"+5.03%",
                          @"+4.81%",
                          @"+3.46%",
                          @"+4.02%",
                          @"+5.81%",
                          @"+5.46%",
                          @"+4.03%",
                          @"+7.81%",
                          @"+5.46%",
                          @"+4.03%",
                          @"+7.81%",
                          @"+7.46%",
                          @"+4.03%",
                          @"+7.81%",
                          @"+2.46%",
                          @"+3.03%",
                          @"+5.81%",
                          @"+8.46%",
                          @"+4.03%",];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(kCollectionItemSizeW, 100);
    layout.minimumInteritemSpacing = 5;
    
    
    self.collectionview = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionID];
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;
    self.collectionview.centerY += 20;
    self.collectionview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.collectionview];
    
    self.closeTableViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeTableViewBtn setImage:[UIImage imageNamed:@"circle-cross"] forState:UIControlStateNormal];
    [self.closeTableViewBtn addTarget:self action:@selector(closeViewController) forControlEvents:UIControlEventTouchUpInside];
    self.closeTableViewBtn.frame = CGRectMake(XWScreenWitdh - 45, 20, 40, 40);
    [self.view addSubview:self.closeTableViewBtn];

    
}

- (void)closeViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.topTitles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = kCollectionID;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
        titleLabel.text = self.topTitles[indexPath.row];
        titleLabel.font = [UIFont systemFontOfSize:13.0];
        [cell.contentView addSubview:titleLabel];
        
        UILabel *limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(titleLabel.frame), 100, 44)];
        limitLabel.textColor = [UIColor redColor];
        limitLabel.text = self.detailTitles[indexPath.row];
        limitLabel.font = [UIFont systemFontOfSize:20.0];
        [cell.contentView addSubview:limitLabel];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

@end

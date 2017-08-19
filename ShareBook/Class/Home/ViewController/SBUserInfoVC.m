//
//  SBUserInfoVC.m
//  ShareBook
//
//  Created by Lee on 2017/8/17.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBUserInfoVC.h"
#import "SBUserInfoView.h"
#import "SBBookInfoCollectionCell.h"

static NSString* kBookInfoCellId = @"kBookInfoCellId";

@interface SBUserInfoVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) SBUserInfoView *mUserInfoView;
@property (strong,nonatomic) UICollectionView *mBookView;

@end

@implementation SBUserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mHeaderView.mTitleLbl.text = @"借书";
    self.mHeaderView.mSeparateLine.hidden = YES;
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
#pragma mark -
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //最多展示4个
    //    NSInteger cellCount = self.mBooks.count > 4 ? 4 : self.mBooks.count;
    return 15;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBBookInfoCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kBookInfoCellId forIndexPath:indexPath];
    
    
    return cell;
}




#pragma mark - UICollectionViewDelegate
#pragma mark -
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeZero;
    switch (indexPath.section)
    {
        case 0:
        {
            size = [SBBookInfoCollectionCell sizeOfCell];
            break;
        }
        default:
            break;
    }
    return size;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [[SBPageJumpManager shareInstance] pushToBookDetailVCBookId:nil];
}

-(void)setupContentView{
    _mUserInfoView = [[SBUserInfoView alloc] init];
    [self.view addSubview:_mUserInfoView];
    [_mUserInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.mHeaderView.mas_bottom);
        make.height.mas_equalTo([SBUserInfoView heightOfInfoView]);
    }];
    [_mUserInfoView layoutIfNeeded];
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    CGFloat height = ScreenH - 64 - _mUserInfoView.height-12;
    CGFloat width = ScreenW - 20;
    _mBookView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, height) collectionViewLayout:layout];
    
    [self.view addSubview:_mBookView];
    [_mBookView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(10);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(width);
        make.bottom.equalTo(self.view.mas_bottom).offset(0*Fit_RATE);
    }];
    _mBookView.backgroundColor = [UIColor clearColor];
    _mBookView.showsHorizontalScrollIndicator = NO;
    _mBookView.showsVerticalScrollIndicator = NO;
    //    _mBookView.bounces = YES;
    
    [_mBookView registerClass:[SBBookInfoCollectionCell class] forCellWithReuseIdentifier:kBookInfoCellId];
    _mBookView.delegate = self;
    _mBookView.dataSource = self;
}

@end

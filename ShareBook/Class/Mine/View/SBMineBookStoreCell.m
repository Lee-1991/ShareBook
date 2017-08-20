//
//  SBMineBookStoreCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBMineBookStoreCell.h"
#import "SBBookInfoCollectionCell.h"

static NSString* kBookInfoCellId = @"kBookInfoCellId";

@interface SBMineBookStoreCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *mBookView;
@property (strong,nonatomic) UIButton *mCountBtn;
@property (strong,nonatomic) UIButton *mAddBtn;
@property (strong,nonatomic) UIButton *mScanBtn;

@end

@implementation SBMineBookStoreCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupContentView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)heightOfCell{
    return [[[SBMineBookStoreCell alloc] init] heightOfCell];
}

-(CGFloat)heightOfCell{
    [self layoutIfNeeded];
    CGFloat height = CGRectGetMaxY(_mAddBtn.frame) + 10*Fit_RATE;
    return height;
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
    return 4;
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


-(void)onClickAddBtn:(UIButton *)sender{
    
}

-(void)onClickScanBtn:(UIButton *)sender{
    
}


-(void)setupContentView{
    CGFloat margin = 10*Fit_RATE;
    UILabel* tipsLbl = [[UILabel alloc] init];
    [self addSubview:tipsLbl];
    tipsLbl.font = FONT(11);
    tipsLbl.textColor = ColorTextLightGray;
    tipsLbl.text = @"我的书店";
    [tipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(margin);
        make.top.equalTo(self.mas_top).offset(margin);
    }];
    
    _mCountBtn = [[UIButton alloc] init];
    [self addSubview:_mCountBtn];
    _mCountBtn.titleLabel.font = FONT(11);
    [_mCountBtn setTitleColor:ColorBlue forState:UIControlStateNormal];
    [_mCountBtn setTitle:@"2本>" forState:UIControlStateNormal];
    _mCountBtn.userInteractionEnabled = NO; 
    [_mCountBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-margin);
        make.centerY.equalTo(tipsLbl.mas_centerY);
    }];
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat height = [SBBookInfoCollectionCell sizeOfCell].height;
    CGFloat width = ScreenW - 20;
    _mBookView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, height) collectionViewLayout:layout];
    
    [self addSubview:_mBookView];
    [_mBookView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(width);
        make.top.equalTo(tipsLbl.mas_bottom).offset(margin);
    }];
    _mBookView.backgroundColor = [UIColor clearColor];
    _mBookView.showsHorizontalScrollIndicator = NO;
    _mBookView.showsVerticalScrollIndicator = NO;
    //    _mBookView.bounces = YES;
    
    [_mBookView registerClass:[SBBookInfoCollectionCell class] forCellWithReuseIdentifier:kBookInfoCellId];
    _mBookView.delegate = self;
    _mBookView.dataSource = self;
    
    _mAddBtn = [[UIButton alloc] init];
    [self addSubview:_mAddBtn];
    _mAddBtn.titleLabel.font = FONT(11);
    [_mAddBtn setTitleColor:ColorBlue forState:UIControlStateNormal];
    [_mAddBtn setTitle:@"手动添加" forState:UIControlStateNormal];
    [_mAddBtn addTarget:self action:@selector(onClickAddBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mAddBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tipsLbl.mas_left);
        make.top.equalTo(_mBookView.mas_bottom).offset(margin);
    }];
    
    _mScanBtn = [[UIButton alloc] init];
    [self addSubview:_mScanBtn];
    _mScanBtn.titleLabel.font = FONT(11);
    [_mScanBtn setTitleColor:ColorBlue forState:UIControlStateNormal];
    [_mScanBtn setTitle:@"扫描添加" forState:UIControlStateNormal];
    [_mScanBtn addTarget:self action:@selector(onClickScanBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_mScanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_mCountBtn.mas_right);
        make.centerY.equalTo(_mAddBtn.mas_centerY);
    }];
}

@end

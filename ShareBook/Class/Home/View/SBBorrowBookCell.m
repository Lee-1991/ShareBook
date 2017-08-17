//
//  SBBorrowBookCell.m
//  ShareBook
//
//  Created by Lee on 2017/8/14.
//  Copyright © 2017年 Lee. All rights reserved.
//

#import "SBBorrowBookCell.h"
#import "SBBorrowBookCellTopView.h"
#import "SBBookInfoCollectionCell.h"

static NSString* kBookInfoCellId = @"kBookInfoCellId";

@interface SBBorrowBookCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) SBBorrowBookCellTopView *mTopView;
@property (strong,nonatomic) UICollectionView *mBookView;

@property (strong,nonatomic) NSArray *mBooks;
@end

@implementation SBBorrowBookCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpContentView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    return 200;
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


-(void)setUpContentView{
    
    _mTopView = [[SBBorrowBookCellTopView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, [SBBorrowBookCellTopView heightOfCellTopView])];
//    _mTopView.backgroundColor = [UIColor lightGrayColor];
//    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:_mTopView];
    
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
        make.bottom.equalTo(self.mas_bottom).offset(0*Fit_RATE);
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

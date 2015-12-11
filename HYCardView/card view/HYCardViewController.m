//
//  HYCardViewController.m
//  HYCardViewController
//
//  Created by hyyy on 15/12/9.
//  Copyright © 2015年 hyyy. All rights reserved.
//

#import "HYCardViewController.h"
#import "HYCardCollectionViewCell.h"

@interface HYCardViewController()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    UICollectionView *mCollectionView;
    
}
@end

@implementation HYCardViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initCollectionViewLayout];
    
    mCollectionView.backgroundColor = [UIColor clearColor];
    
    //register collectionViewCell
    [mCollectionView registerClass:[HYCardCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    //delegate
    mCollectionView.delegate = self;
    mCollectionView.dataSource = self;
    
    [self.view addSubview:mCollectionView];
}

//初始化mCollectionView的位置
- (void)initCollectionViewLayout{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    float itemWidth = 90;
    float itemHeight = 50;
    switch (_dataArr.count) {
        case 1:{
            CGRect frame = CGRectMake((self.view.frame.size.width - itemWidth)/2, (self.view.frame.size.height - itemHeight)/2, itemWidth, itemHeight);
            mCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
            mCollectionView.center = self.view.center;
        }
            break;
            
        case 2:{
            CGRect frame = CGRectMake((self.view.frame.size.width - itemWidth*2)/2, (self.view.frame.size.height - itemHeight)/2, (itemWidth + 15)*2, itemHeight);
            mCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
            mCollectionView.center = self.view.center;
            mCollectionView.scrollEnabled = NO;
        }
            break;
            
        case 3:{
            CGRect frame = CGRectMake(0, (self.view.frame.size.height - itemHeight)/2, self.view.frame.size.width, itemHeight);
            mCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
            mCollectionView.center = self.view.center;
            mCollectionView.scrollEnabled = NO;
        }
            break;
            
        case 4:{
            CGRect frame = CGRectMake((self.view.frame.size.width - itemWidth*2)/2, (self.view.frame.size.height - itemHeight*2)/2, (itemWidth +15)*2, (itemHeight +15)*2);
            mCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
            mCollectionView.center = self.view.center;
            mCollectionView.scrollEnabled = NO;
        }
            break;
            
        default:
            mCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
            mCollectionView.center = self.view.center;
            break;
    }
}

# pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYCardCollectionViewCell *cell = (HYCardCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.txtLabel.text = _dataArr[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:6 / 255.0 green:125 / 255.0 blue:255 / 255.0 alpha:1.0];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(90, 50);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Section %lu, Row %lu", indexPath.section, indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

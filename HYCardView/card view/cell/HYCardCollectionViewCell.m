//
//  HYCardViewCellCollectionViewCell.m
//  HYCardView
//
//  Created by hyyy on 15/12/9.
//  Copyright © 2015年 hyyy. All rights reserved.
//

#import "HYCardCollectionViewCell.h"

@implementation HYCardCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
        _txtLabel.textAlignment = NSTextAlignmentCenter;
        _txtLabel.textColor = [UIColor whiteColor];
        _txtLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_txtLabel];
    }
    return self;
}

@end

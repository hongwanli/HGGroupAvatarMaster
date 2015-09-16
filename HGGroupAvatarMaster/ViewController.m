//
//  ViewController.m
//  HGGroupAvatarMaster
//
//  Created by XiaoDou on 15/9/16.
//  Copyright (c) 2015年 北京嗨购电子商务有限公司. All rights reserved.
//

#import "ViewController.h"

#define kActionBtnSize                          (120/2.0f)
#define kActionBtnTitleVPaddingActionBtnImg     (14/2.0f)
#define kActionBtnMarginToScreenBottom          (204/2.0f)
#define kActionBtnHPadding                      (70/2.0f)
#define kActionBtnFontsize                      (20/2.0f)

#define kDismissBtnSize                         (32.0f)
#define kRowVPadding                            (100/2.0f)

#define kColumnCount                            (3)

@interface ViewController () {
    NSMutableArray *_models;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _models = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    for (int i = 0; i < _models.count; i++) {
        CGRect frame = [self layoutButtonFrameWithIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:imageView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)layoutButtonFrameWithIndex:(NSInteger)index {
    NSInteger rowCount = _models.count / kColumnCount + (_models.count % kColumnCount == 0 ? 0 : 1);
    NSInteger itemsCountInOneRow = 0;
    NSInteger currentRowNum = index / kColumnCount;
    //最后一行
    if (rowCount > 0 && currentRowNum == (rowCount - 1)) {
        itemsCountInOneRow = _models.count - currentRowNum * kColumnCount;
    } else {//非最后一行
        itemsCountInOneRow = _models.count > kColumnCount ? kColumnCount : _models.count;
    }
    
    CGFloat baseLeft = (self.view.frame.size.width - itemsCountInOneRow * kActionBtnSize - (itemsCountInOneRow - 1)*kActionBtnHPadding) / 2.0;
    CGFloat baseTop = self.view.frame.size.height - kActionBtnSize * rowCount - (rowCount - 1) * kRowVPadding - kActionBtnMarginToScreenBottom;
    CGFloat left = baseLeft + (index % kColumnCount) * (kActionBtnSize + kActionBtnHPadding);
    CGFloat top = baseTop + (index / kColumnCount) * (kActionBtnHPadding + kRowVPadding);
    CGRect frame = CGRectMake(left, top, kActionBtnSize, kActionBtnSize);
    return frame;
}


@end

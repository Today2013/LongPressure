//
//  CollectionCell.h
//  LongPressure
//
//  Created by TomatoPeter on 15/9/6.
//  Copyright (c) 2015年 ChenJianglin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CollectionCellDelegate <NSObject>

- (void)collectionViewLongGestureWithIndexpath:(NSIndexPath *)indexpath;

@end
@interface CollectionCell : UICollectionViewCell
@property(nonatomic, strong)NSIndexPath *indexpath;
@property (weak, nonatomic) IBOutlet UILongPressGestureRecognizer *longGesture;
@property(nonatomic, assign)id<CollectionCellDelegate>delegate;
@property (strong, nonatomic) IBOutlet UIImageView *headImgV;
@end


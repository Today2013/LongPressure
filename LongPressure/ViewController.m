//
//  ViewController.m
//  LongPressure
//
//  Created by TomatoPeter on 15/9/6.
//  Copyright (c) 2015年 ChenJianglin. All rights reserved.
//

#import "ViewController.h"
#import "CollectionCell.h"
#import "LabelVC.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>


@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CollectionCellDelegate, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = flowLayout;
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    /**
     *  ////
     *
     *  @param NSInteger
     *
     *  @return
     */
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    cell.delegate = self;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LabelVC *lableVC = [[LabelVC alloc] initWithNibName:@"LabelVC" bundle:nil];
    [self presentViewController:lableVC animated:YES completion:^{
        
    }];
    
}
#pragma mark - collectionView delegate
- (void)collectionViewLongGestureWithIndexpath:(NSIndexPath *)indexpath
{
    NSArray * array = [self.collectionView visibleCells];
    int i = 0;//获取数组中得view位置
    for (CollectionCell * cell in array) {
        i = i + 1;
        //角度偏移矩阵
        CGAffineTransform t1 = CGAffineTransformMakeRotation(0.03);
        CGAffineTransform t2 = CGAffineTransformMakeRotation(-0.03);
        
        if (i%2 == 1)
        {
            cell.transform = t1;
        }
        else
        {
            cell.transform = t2;
        }
        
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
            //[UIView setAnimationRepeatCount:12.0];
            if (i%2 == 1)
            {
                cell.transform = t2;
            }
            else
            {
                cell.transform = t1;
            }
            
        } completion:^(BOOL finished){
            
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^
             {
                 CGAffineTransform t = CGAffineTransformMakeScale(1,1);
                 NSArray * ary = [self.collectionView visibleCells];
                 for (CollectionCell * view in ary)
                 {
                     view.tag = 0;
                     view.transform = t;
                 }
             } completion:^(BOOL finished)
             {
                 NSLog(@"完成");
             }];
            
            
        }];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

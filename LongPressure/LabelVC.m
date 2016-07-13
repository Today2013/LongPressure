//
//  LabelVC.m
//  LongPressure
//
//  Created by TomatoPeter on 15/9/7.
//  Copyright (c) 2015年 ChenJianglin. All rights reserved.
//

#import "LabelVC.h"
#import "CJLPopoverView.h"
@interface LabelVC ()
@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation LabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString * htmlString = @"<html><body> Some html string 了的撒两节课了进口大数据量附加费外哦如甲方的拉斯克奖吃饭分啊叫我it界阿里JDCFQXJWFGJALSEJFNOQWERIJFXM ADK  \n <font size=\"13\" color=\"red\">This is some text!</font> </body></html>";
    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    self.label.attributedText = attrStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popButtonlClicked:(id)sender {
    UIButton *but = sender;
    CGPoint point = CGPointMake(but.frame.origin.x + but.frame.size.width/2, but.frame.origin.y + but.frame.size.height + 25);
    CJLPopoverView *pop = [[CJLPopoverView alloc] initWithPoint:point titles:@[@"hfdj", @"123456", @"jdfsbgdf"] images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", (long)index);
        
    };
    [pop show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

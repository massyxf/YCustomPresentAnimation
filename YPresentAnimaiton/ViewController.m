//
//  ViewController.m
//  YPresentAnimaiton
//
//  Created by yxf on 2017/6/17.
//  Copyright © 2017年 yxf. All rights reserved.
//

#import "ViewController.h"
#import "YPresentModel.h"
#import "YPresentViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,YPresentViewControllerDelegate>

/** presenModel*/
@property(nonatomic,strong)YPresentModel *presentModel;

/** hideStatusBar*/
@property(nonatomic,assign)BOOL hideStatusBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 100)];
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentImage:)];
    [imageView addGestureRecognizer:gesture];
}

-(BOOL)prefersStatusBarHidden{
    return self.hideStatusBar;
}

#pragma mark - getter
-(YPresentModel *)presentModel{
    if (!_presentModel) {
        _presentModel = [[YPresentModel alloc] init];
    }
    return _presentModel;
}
#pragma mark - action
-(IBAction)presentImage:(UITapGestureRecognizer *)sender{
    self.presentModel.image = [UIImage imageNamed:@"1.jpg"];
    self.presentModel.touchViewFrame = sender.view.frame;
    YPresentViewController *presentVc = [[YPresentViewController alloc] init];
    presentVc.modalPresentationStyle = UIModalPresentationCustom;
    presentVc.transitioningDelegate = self;
    presentVc.image = [UIImage imageNamed:@"1.jpg"];
    presentVc.delegate = self;
    [self presentViewController:presentVc animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentModel;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.presentModel;
}

#pragma mark - YPresentViewControllerDelegate
-(void)presentVcWillPresent:(YPresentViewController *)presentVc{
    self.hideStatusBar = YES;
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)presentVcWillDissmiss:(YPresentViewController *)presentVc{
    self.hideStatusBar = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

@end

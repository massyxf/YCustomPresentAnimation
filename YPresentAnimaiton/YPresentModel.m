//
//  YPresentModel.m
//  YPresentAnimaiton
//
//  Created by yxf on 2017/6/17.
//  Copyright © 2017年 yxf. All rights reserved.
//

#import "YPresentModel.h"

@interface YPresentModel ()

/** touchImageView*/
@property(nonatomic,weak)UIImageView *touchImageView;

@end

@implementation YPresentModel

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    containerView.backgroundColor = [UIColor blackColor];
    
    UIImage *modelImage = _image;
    CGRect modelRect = _touchViewFrame;
    
    if (!_touchImageView)
    {
        UIImageView *touchImageView = [[UIImageView alloc] initWithFrame:modelRect];
        touchImageView.contentMode = UIViewContentModeScaleAspectFill;
        touchImageView.clipsToBounds = YES;
        [containerView addSubview:touchImageView];
        touchImageView.image = modelImage;
        _touchImageView = touchImageView;
    }
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGFloat animationTime = [self transitionDuration:transitionContext];
    __weak typeof(self) weakSelf = self;
    if (toVc.isBeingPresented)
    {//present
        //⚠️这里不能把fromVc.view添加到containerView上，不然containerView消失的时候fromVc.view也会跟着消失
        [UIView animateWithDuration:animationTime
                         animations:^{
                             weakSelf.touchImageView.frame = toVc.view.frame;
                         } completion:^(BOOL finished) {
                             weakSelf.touchImageView.hidden = YES;
                             [containerView addSubview:toVc.view];
                             [transitionContext completeTransition:YES];
                         }];
    }
    else
    {//dismiss
        _touchImageView.image = modelImage;
        _touchImageView.hidden = NO;
        fromVc.view.hidden = YES;
        
        [containerView bringSubviewToFront:_touchImageView];
        [UIView animateWithDuration:animationTime
                         animations:^{
                             weakSelf.touchImageView.frame = modelRect;
                             containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0];
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    
}

@end

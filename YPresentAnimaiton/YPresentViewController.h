//
//  YPresentViewController.h
//  YPresentAnimaiton
//
//  Created by yxf on 2017/6/17.
//  Copyright © 2017年 yxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPresentViewController;

//这里的代理方法是用来隐藏和显示statusbar的
@protocol YPresentViewControllerDelegate <NSObject>

-(void)presentVcWillPresent:(YPresentViewController *)presentVc;

-(void)presentVcWillDissmiss:(YPresentViewController *)presentVc;

@end

@interface YPresentViewController : UIViewController

/** image*/
@property(nonatomic,strong)UIImage *image;

/** delegate*/
@property(nonatomic,weak)id<YPresentViewControllerDelegate> delegate;

@end

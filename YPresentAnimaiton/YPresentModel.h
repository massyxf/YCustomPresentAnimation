//
//  YPresentModel.h
//  YPresentAnimaiton
//
//  Created by yxf on 2017/6/17.
//  Copyright © 2017年 yxf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YPresentModel : NSObject<UIViewControllerAnimatedTransitioning>

/** touch view frame*/
@property(nonatomic,assign)CGRect touchViewFrame;

/** image*/
@property(nonatomic,strong)UIImage *image;

@end

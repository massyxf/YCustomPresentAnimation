//
//  YPresentViewController.m
//  YPresentAnimaiton
//
//  Created by yxf on 2017/6/17.
//  Copyright © 2017年 yxf. All rights reserved.
//

#import "YPresentViewController.h"

@interface YPresentViewController ()

@end

@implementation YPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imageView];
    imageView.image = _image;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.delegate respondsToSelector:@selector(presentVcWillPresent:)]) {
        [self.delegate presentVcWillPresent:self];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(presentVcWillDissmiss:)]) {
        [self.delegate presentVcWillDissmiss:self];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

//
//  ViewController.m
//  ImageBlur
//
//  Created by YouXianMing on 15/11/19.
//  Copyright © 2015年 YouXianMing. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    CGFloat width  = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    
    // init scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.pagingEnabled = YES;
    scrollView.bounces       = NO;
    scrollView.contentSize   = CGSizeMake(width * 4, height);
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    // init 4 imageView
    for (int i = 0; i < 4; i++) {
        
        UIImageView *imageView        = [[UIImageView alloc] initWithFrame:CGRectMake(width * i, 0, width, height)];
        imageView.contentMode         = UIViewContentModeScaleAspectFill;
        imageView.layer.borderWidth   = 4.f;
        imageView.layer.masksToBounds = YES;
        [scrollView addSubview:imageView];
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
            
            UIImage *image = nil;
            
            if (i == 0) {
                
                // Normal image.
                image = [UIImage imageNamed:@"normal"];
                
            } else if (i == 1) {
            
                // Blured image.
                image = [[UIImage imageNamed:@"normal"] blurImage];
                
            } else if (i == 2) {
            
                // Blured image.
                image = [[UIImage imageNamed:@"normal"] blurImageAtFrame:CGRectMake(0, 0, width, height / 2.f)];
                
            } else if (i == 3) {
            
                // GrayScale image.
                image = [[UIImage imageNamed:@"normal"] grayScale];
                
            } else {
            
                // Normal image.
                image = [UIImage imageNamed:@"normal"];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                imageView.image = image;
            });
        });
    }
}

@end

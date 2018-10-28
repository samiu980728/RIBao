//
//  SecondaryMessageViewController.h
//  ribao
//
//  Created by 萨缪 on 2018/10/27.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainWKWebView.h"
#import <Masonry.h>


@interface SecondaryMessageViewController : UIViewController
<UIGestureRecognizerDelegate>
@property (nonatomic, strong) mainWKWebView * mainWebView;

@end

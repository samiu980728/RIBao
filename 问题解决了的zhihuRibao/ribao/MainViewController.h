//
//  MainViewController.h
//  ribao
//
//  Created by 萨缪 on 2018/10/23.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainView.h"
#import "ViewController.h"
#import "mainWKWebView.h"
@interface MainViewController : UIViewController

@property (nonatomic, strong) mainView * MainView;

@property (nonatomic, assign) NSInteger iNum;

@property (nonatomic, strong) ViewController * viewController;

@property (nonatomic, strong) VVeiw * messageView;

@property (nonatomic, strong) mainWKWebView * mainWebView;
@end

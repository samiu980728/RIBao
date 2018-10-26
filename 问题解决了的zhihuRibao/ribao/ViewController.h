//
//  ViewController.h
//  ribao
//
//  Created by 萨缪 on 2018/10/16.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VVeiw.h"
#import "mainView.h"
@interface ViewController : UIViewController

@property (nonatomic, strong) VVeiw * aView;

@property (nonatomic, strong) VVeiw * bView;

@property (nonatomic, assign) NSInteger iNum;

@property (nonatomic, strong) mainView * MView;

@end


//
//  mainView.h
//  ribao
//
//  Created by 萨缪 on 2018/10/22.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnalysisJSONModel.h"
#import "NewsTableViewCell.h"
#import "mainWKWebView.h"
@interface mainView : UIView
<UITableViewDelegate, UITableViewDataSource>
//mainTableView
@property (nonatomic, strong) UITableView * mainMessageTableView;

//解析JSON数据要用到的数组
@property (nonatomic, strong) NSMutableArray * analyJSONMutArray;

@property (nonatomic, strong) AnalysisJSONModel * analyJSONModel;

@property (nonatomic, strong) UILabel * navigationTextLabel;

@property (nonatomic, strong) UIButton * leftNavigationButton;

@property (nonatomic, strong) NSDictionary * analyJSONDict;
//每个cell要用到的label 与 button
@property (nonatomic, strong) UILabel * newsLabel;

@property (nonatomic, strong) UIImageView * newsImageView;

@property (nonatomic, strong) NSMutableArray * titleMutArray;

@property (nonatomic, strong) NSMutableArray * imageMutArray;


//创建每个cell的推送显示  一个label 一个image
@property (nonatomic, strong) NewsTableViewCell * newsTableViewCell;
//创建主页面各个信息
//注意cell 的数量由JSONModelMut.count的数量决定
- (void)initMainTableView;

//创建顶部导航栏
- (void)initNavigationController;

//获取当前屏幕显示的ViewController
- (UIViewController *)getCurrentVC;

//创建cell点击后的跳转页面
@property (nonatomic, strong) mainWKWebView * mainWebView;


@end

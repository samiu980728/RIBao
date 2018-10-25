//
//  ViewController.m
//  ribao
//
//  Created by 萨缪 on 2018/10/16.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "VVeiw.h"
#import "mainView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _iNum = 0 ;
    
    _aView = [[VVeiw alloc] init];
    
    _bView = [[VVeiw alloc] init];
    
    _MView = [[mainView alloc] init];
    
    [_MView initMainTableView];
    //[_bView initScrollView];
    
    [_bView initTableView];
    
    
    
    //[_aView initView];
   // [_aView.guideButton addTarget:self action:@selector(showSelectColumn:) forControlEvents:UIControlEventTouchUpInside];
    
    [_aView initMainTableView];
    
    //[self.view addSubview:_bView];
    [self.view addSubview:_aView];
    //[self.view addSubview:_MView];
    
    [_aView.messageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
                make.left.equalTo(self.view);
                make.top.equalTo(self.view);
                make.bottom.equalTo(self.view).offset(-50);
                make.width.mas_equalTo(414);
                make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-50);
        
        
        //make.edges.equalTo(self.view);
    }];
    
    
    
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.top.equalTo(self.view).offset(50);
//        make.bottom.equalTo(self.view).offset(-50);
//        make.width.mas_equalTo(250);
//        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-100);

        make.edges.equalTo(self.view);
    }];
    
    
    
//    [_bView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.view).mas_offset(0);
//        make.top.mas_equalTo(self.view).mas_offset(0);
//        make.width.mas_equalTo(250);
//        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
//
//    }];
//
//    [_MView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//    }];
    
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationItem.title = @"每日新闻";
//
//    UIBarButtonItem * leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeftBarButton:)];
//    self.navigationItem.leftBarButtonItem = leftBarButton;
//}

- (void)pressLeftBarButton:(UIBarButtonItem *)leftBtn
{
    NSLog(@"666666");
    if ( _iNum == 0 ){
        [_aView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //        make.height.mas_equalTo(self.view.bounds.size.height);
            //        make.width.mas_equalTo(
            make.left.equalTo(self.view).offset(250);
            make.top.equalTo(self.view).offset(0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
            make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
            //make.edges.equalTo(self.view);
        }];
        //在这里new 一个新的视图！
        
        //[_aView initScrollView];
        _iNum++;
    }
    
    
    else{
        [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        //在这里new出来的新视图 坐标改变！
        _iNum--;
    }
}


//这本身就是个scrollView  !! 只是一开始展示的是第二页！！！
//点击butoon 后 mainView 右移 重新设置frame
- (void)showSelectColumn:(UIButton *)btn
{
    NSLog(@"666666");
    if ( _iNum == 0 ){
    [_aView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //        make.height.mas_equalTo(self.view.bounds.size.height);
        //        make.width.mas_equalTo(
        make.left.equalTo(self.view).offset(250);
        make.top.equalTo(self.view).offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
        //make.edges.equalTo(self.view);
    }];
        //在这里new 一个新的视图！
        
        //[_aView initScrollView];
        _iNum++;
    }
    

    else{
        [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        //在这里new出来的新视图 坐标改变！
        _iNum--;
    }
    
    
    //[_aView initScrollView];
    
//    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //        make.height.mas_equalTo(self.view.bounds.size.height);
//        //        make.width.mas_equalTo(
//        make.left.mas_equalTo(_aView.messageScrollew.mas_right).mas_offset(20);
//    }];
}

- (void)returnButton:(UIButton *)btn
{
    [_aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    btn.selected = !btn.selected;
}

//点击任意位置 视图移动到原位
//还得添加一个事件  按钮是否是 被选择状态？？？


//- (void)viewWillDisappear:(BOOL)animated
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notification" object:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

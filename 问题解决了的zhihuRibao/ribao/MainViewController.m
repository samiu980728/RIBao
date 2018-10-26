//
//  MainViewController.m
//  ribao
//
//  Created by 萨缪 on 2018/10/23.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "MainViewController.h"
#import <Masonry.h>
#import "VVeiw.h"
@interface MainViewController ()

@end

@implementation MainViewController

//这个Controller 承载mainView 在这里设置导航栏 与左侧按钮 如果点击按钮 思路1:传入通知到另一个controller
//让另一个controller入场 这个controller上的mainVIew的坐标进行偏移
//那个controller上的View坐标展露一部分与mainController一起填充整个页面即可
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _messageView = [[VVeiw alloc] init];
    
    [_messageView initTableView];
    
    [self.view addSubview:_messageView];
    
    //_viewController = [[ViewController alloc] init];
    
   // _viewController.view.backgroundColor = [UIColor yellowColor];
    //[self.view addSubview:_viewController.view];
    
    
    
    _MainView = [[mainView alloc] init];
    
    [_MainView initMainTableView];
    
    [_MainView.leftNavigationButton addTarget:self action:@selector(pressLeftBarButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_MainView];
    
    [_MainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
//    _mainWebView = [[mainWKWebView alloc] init];
//
//    [_mainWebView createWKWebView];
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
        [_MainView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //        make.height.mas_equalTo(self.view.bounds.size.height);
            //        make.width.mas_equalTo(
            make.left.equalTo(self.view).offset(250);
            make.top.equalTo(self.view).offset(0);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width-250);
            make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
            
            //创建另一个controller
            
            
            
            [_messageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view);
                make.top.equalTo(self.view).offset(50);
                make.bottom.equalTo(self.view).offset(-50);
                make.width.mas_equalTo(250);
                make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height-100);
            }];
            
            //make.edges.equalTo(self.view);
        }];
        //在这里new 一个新的视图！
        
        //[_aView initScrollView];
        _iNum++;
    }
    
    
    else{
        [_MainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        //在这里new出来的新视图 坐标改变！
        _iNum--;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

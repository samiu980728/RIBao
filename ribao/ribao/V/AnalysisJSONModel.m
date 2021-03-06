//
//  AnalysisJSONModel.m
//  ribao
//
//  Created by 萨缪 on 2018/10/21.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "AnalysisJSONModel.h"
#import "MainJSONModel.h"
#import "mainView.h"
@implementation AnalysisJSONModel

 -(void)AnalysisJSON
{
    
    NSLog(@"-------------123213--------");
    _testUrlStr = @"https://news-at.zhihu.com/api/4/news/latest";
    _testUrlStr = [_testUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    _testUrl = [NSURL URLWithString:_testUrlStr];
    
    _testRequest = [NSURLRequest requestWithURL:_testUrl];
    _testSession = [NSURLSession sharedSession];
    _testDataTask = [_testSession dataTaskWithRequest:_testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if ( error == nil ){
            //这里写一个通知 网络请求接收到了之后再到 VView.m文件中回传通知
            //在通知里执行数组 数组属性赋值的方法
            
            
        _obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        _totalJSONModel = [[TotalJSONModel alloc] initWithDictionary:_obj error:nil];
        
        _JSONModelMut = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < _totalJSONModel.stories.count; i++) {
            _storiesJSONModel = [[StoriesJSONModel alloc] initWithDictionary:_obj[@"stories"][i] error:nil];
            if ( _storiesJSONModel ){
            [_JSONModelMut addObject:_storiesJSONModel];
            }
        }
        
        for (int i = 0; i < _totalJSONModel.top_stories.count; i++) {
            _mainJSONModel = [[MainJSONModel alloc] initWithDictionary:_obj[@"top_stories"][i] error:nil];
            if ( _mainJSONModel ){
            [_JSONModelMut addObject:_mainJSONModel];
            }
        }
            NSLog(@"_JSONModelMut ====  ---- %@ ----",_JSONModelMut);
            
            //取值
            MainJSONModel * MModel = _JSONModelMut[0];
            
            NSLog(@"MModel = %@",MModel.title);
            
//            NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
//            [center addObserver:self selector:@selector(changJSONModel:) name:@"notification" object:nil];
    
            NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:_JSONModelMut,@"one", nil];
            NSNotification * notification = [NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
            
            [[NSNotificationCenter defaultCenter] postNotification:notification];
            
        }
        
    }];
    [_testDataTask resume];
    
}

- (void)changJSONModel:(NSNotification *)noti
{
    //_analyJSONModel = [[AnalysisJSONModel alloc] init];

    //不是应该在这里打印 NSLog(@"_JSONModelMut ====  ---- %@ ----",_JSONModelMut);吗？


    mainView * MView = [[mainView alloc] init];

    NSLog(@"analyJSONModel.JSONModelMut = %@",_JSONModelMut);

    if ( [_JSONModelMut isKindOfClass:[NSArray class]] && _JSONModelMut.count > 0 ){
       MView.analyJSONMutArray = [NSMutableArray arrayWithArray:_JSONModelMut];
    }
    NSLog(@"_analyJSONMutArray = %@",MView.analyJSONMutArray);

    //在这里面进行cell 单元格的赋值
//    _mainMessageTableView = [[UITableView alloc] init];
//
//    _mainMessageTableView.delegate = self;
//    _mainMessageTableView.dataSource = self;
//    [self addSubview:_mainMessageTableView];

//    [_mainMessageTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self);
//        make.top.equalTo(self).offset(100);
//        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
//        make.height.mas_equalTo([UIScreen mainScreen].bounds.size.height);
//    }];
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notification" object:nil];
//}
@end

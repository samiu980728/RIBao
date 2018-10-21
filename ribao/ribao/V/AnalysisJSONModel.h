//
//  AnalysisJSONModel.h
//  ribao
//
//  Created by 萨缪 on 2018/10/21.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainJSONModel.h"
@interface AnalysisJSONModel : NSObject

@property (nonatomic, strong) NSString * testUrlStr;

@property (nonatomic, strong) NSURL * testUrl;

@property (nonatomic, strong) NSURLRequest * testRequest;

@property (nonatomic, strong) NSURLSession * testSession;

@property (nonatomic, strong) NSURLSessionDataTask * testDataTask;

@property (nonatomic, strong) NSDictionary * obj;

@property (nonatomic, strong) NSMutableArray * JSONModelMut;

@property (nonatomic, strong) TotalJSONModel * totalJSONModel;

@property (nonatomic, strong) MainJSONModel * mainJSONModel;

@property (nonatomic, strong) StoriesJSONModel * storiesJSONModel;

@end

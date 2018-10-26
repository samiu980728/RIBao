//
//  mainWKWebView.h
//  ribao
//
//  Created by 萨缪 on 2018/10/25.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <Masonry.h>
#import <JSONModel.h>
#import "getNewsJSONModel.h"
@interface mainWKWebView : UIView

<WKNavigationDelegate, WKUIDelegate>
@property (nonatomic, strong) WKWebView * webView;

@property (nonatomic, strong) WKUserContentController * userContentController;

//解析JSONModel
@property (nonatomic, strong) NSDictionary * obj;

@property (nonatomic, strong) NSMutableArray * JSONModelMut;

@property (nonatomic, copy) NSString * modelStr;

- (void)createAndGetJSONModelWKWebView;


@end

//
//  mainWKWebView.m
//  ribao
//
//  Created by 萨缪 on 2018/10/25.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "mainWKWebView.h"


@implementation mainWKWebView 

- (void)createAndGetJSONModelWKWebView
{
    NSString *testUrlStr = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/3892357"];
    
    //拼接中文参数
    testUrlStr = [testUrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *testUrl = [NSURL URLWithString:testUrlStr];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            _obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //使用NSJSONReadingMutableContainers，则返回的对象是可变的，NSMutableDictionary
            
            //NSLog(@"x--%@---", obj);
            //TotalJSONModel *totalJSONModel = [[TotalJSONModel alloc] initWithDictionary:obj error:nil];
            getNewsJSONModel * newsModel = [[getNewsJSONModel alloc] initWithDictionary:_obj error:nil];
            
            _JSONModelMut = [[NSMutableArray alloc] init];
            
            for (int i = 0; i < newsModel.section.count; i++) {
                sectionJSONModel * sectionModel = [[sectionJSONModel alloc] initWithDictionary:_obj[@"section"][i] error:nil];
                if ( sectionModel ){
                    //[JSONModelMut addObject:sectionModel];
                }
            }
            
           // NSLog(@"newsModel.section.count == %li",newsModel.section.count);
            
            //NSLog(@"obj === =  %@",_obj);
            
            [_JSONModelMut addObject:_obj];
            
            NSString * str = [NSString stringWithFormat:@"%@",_obj];
            
            //NSLog(@"str ========  %@=======",str);
        }
    }];
    [testDataTask resume];
    
    
    
    _webView = [[WKWebView alloc] init];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [self addSubview:_webView];
    
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    
    //[_webView loadHTMLString:@"https://news-at.zhihu.com/api/4/news/3892357" baseURL:nil];
    //这是一个H5界面 不能直接打开 需要用一个方法
    NSURL * fileURL = [NSURL URLWithString:@"https://news-at.zhihu.com/api/4/news/3892357"];
    
    //[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/4/news/3892357"]]];
    
   // NSString * modelStr = [NSString ]
    
    _modelStr = [NSString stringWithFormat:@"%@",_obj];
    
    [_webView loadHTMLString:_modelStr baseURL:nil];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/4/news/3892357"]]];
    
    NSLog(@"https://news-at.zhihu.com/api/4/news/9699382-----=-=-=-=-=-");
    
    
    
}

 -(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    
}

//内容开始返回时调用
 -(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    
}


/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    
    NSLog(@"navigationResponse.response.URL.host.lowercaseString = %@",navigationResponse.response.URL.host.lowercaseString);
    if ( [navigationResponse.response.URL.host.lowercaseString isEqual:@"https://news-at.zhihu.com/api/4/news/3892357"] ){
        decisionHandler(WKNavigationResponsePolicyAllow);
        return;
    }
    
    decisionHandler(WKNavigationResponsePolicyCancel);
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    // 如果请求的是百度地址，则延迟5s以后跳转
    if ([navigationAction.request.URL.host.lowercaseString isEqual:@"https://news-at.zhihu.com/api/4/news/3892357"]) {
        
        //        // 延迟5s之后跳转
        //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        //            // 允许跳转
        //            decisionHandler(WKNavigationActionPolicyAllow);
        //        });
        
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    // 不允许跳转
    decisionHandler(WKNavigationActionPolicyCancel);
}

//- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView API_AVAILABLE(macosx(10.11), ios(9.0))
//{
//    [webView reload];
//}
//
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
//    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
//        NSURLCredential *card = [[NSURLCredential alloc]initWithTrust:challenge.protectionSpace.serverTrust];
//        completionHandler(NSURLSessionAuthChallengeUseCredential,card);
//    }
//}
//
//- (WKUserContentController *)userContentController
//{
//    if (!_userContentController) {
//        _userContentController = [[WKUserContentController alloc] init];
//        //交互关键代码
//        [_userContentController addScriptMessageHandler:self name:@"webViewApp"];
//    }
//    return _userContentController;
//}

- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        if([challenge previousFailureCount] ==0){
            
            NSURLCredential*credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            
            completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
            
        }else{
            
            completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge,nil);
            
        }
    }else{
        
        completionHandler(NSURLSessionAuthChallengeCancelAuthenticationChallenge,nil);
        
    }
    
}





@end

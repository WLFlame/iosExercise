//
//  UIWebViewVC.m
//  UIKit
//
//  Created by ywl on 16/5/16.
//  Copyright © 2016年 ywl. All rights reserved.
//

#import "UIWebViewVC.h"

@interface UIWebViewVC () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *web;
@end

@implementation UIWebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *web = [[UIWebView alloc] init];
    self.web = web;
    web.frame = self.view.bounds;
    [self.view addSubview:web];
    web.delegate = self;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [web loadRequest:request];
    // 加载html文件
//    [web loadHTMLString:<#(nonnull NSString *)#> baseURL:<#(nullable NSURL *)#>]
    // 加载mime文件类型
//    [web loadData:<#(nonnull NSData *)#> MIMEType:<#(nonnull NSString *)#> textEncodingName:<#(nonnull NSString *)#> baseURL:<#(nonnull NSURL *)#>]
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"test" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
    self.web.allowsInlineMediaPlayback = YES;
//    这个值决定了网页内容的渲染是否在把内容全部加载到内存中再去处理。
//    如果设置为YES，只有网页内容加载到内存里了才会去渲染
    self.web.suppressesIncrementalRendering = YES;
    self.web.keyboardDisplayRequiresUserAction = YES;
}

- (void)test
{
    [self.web reload];
    // 停止加载
//    [self.web stopLoading];
    // 后退
//    [self.web goBack];
    // 前进
//    [self.web goForward];
    
    // 能否后腿
    NSLog(@"%d", [self.web canGoBack]);
    // 能否前进
    NSLog(@"%d", [self.web canGoForward]);
    // 是否正在加载
    NSLog(@"%d", [self.web isLoading]);
    // 执行js
//    [self.web stringByEvaluatingJavaScriptFromString:<#(nonnull NSString *)#>]
    self.web.scalesPageToFit = YES;
    self.web.dataDetectorTypes = UIDataDetectorTypeAll;
}

#pragma mark -- UIWebViewDelegate


@end

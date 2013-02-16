//
//  VimeoHelper.m
//  PlayVimeo
//
//  Created by Tan Nguyen on 1/30/13.
//  Copyright (c) 2013 East Agile. All rights reserved.
//

#import "VimeoHelper.h"

@implementation VimeoHelper

- (id)init
{
    self = [super init];
    if(self) {
        _webView = [[UIWebView alloc] init];
    }
    return self;
}

- (void)getVimeoRedirectUrlWithUrl:(NSString *)url delegate:(id<VimeoDelegate>)delegate
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    _originUrl = url;
    _delegate = delegate;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [_webView setDelegate:(id<UIWebViewDelegate>)self];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if(_webViewPlay == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"vimeo.js" ofType:@"txt"];
        NSString *jsCode = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        [_webView stringByEvaluatingJavaScriptFromString:jsCode];
        
        NSString *urlStr = [_webView stringByEvaluatingJavaScriptFromString:@"getUrl()"];
        if([urlStr isEqual:@""])
            return;
        _webViewPlay = [[UIWebView alloc] init];
        [_webViewPlay loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
        [_webViewPlay setDelegate:(id<UIWebViewDelegate>)self];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if(_webViewPlay != nil && navigationType == UIWebViewNavigationTypeOther) {
        NSString *url = [[request URL] absoluteString];
        if([VimeoHelper isLiveURL:url]) {
            [_delegate finishedGetVimeoURL:url];
            [_webViewPlay loadHTMLString:@"EMPTY" baseURL:nil];
            _webViewPlay = nil;
        }
    }
    return YES;
}

+ (BOOL)isLiveURL:(NSString *)url {
    NSError  *error  = NULL;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"https?:\\/\\/((?:av.vimeo|pdl.vimeocdn).com).+" options:0 error:&error];
    
    NSTextCheckingResult *match = [regex firstMatchInString:url
                                                    options:0
                                                      range:NSMakeRange(0, [url length])];
    return !!match;
}
@end

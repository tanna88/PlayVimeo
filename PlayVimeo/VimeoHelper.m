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
    _originUrl = url;
    _delegate = delegate;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    [_webView setDelegate:(id<UIWebViewDelegate>)self];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"vimeo" ofType:@"js"];
    NSString *jsCode = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [_webView stringByEvaluatingJavaScriptFromString:jsCode];
    
    NSString *url = [_webView stringByEvaluatingJavaScriptFromString:@"window.vimeourl"];
    if([url isEqual:@""])
        return;
    _connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Expanded URL = %@", [[response URL] absoluteString]);
}

//void async(void (^block)())
//{
//    [NSThread detachNewThreadSelector:@selector(invoke) toTarget:[block copy] withObject:nil];
//}
//
////__attribute__((sentinel(NULL)))
//void wait_for_conditions(void (^block)(), NSCondition *condition, ...)
//{
//    va_list args;
//    va_start(args, condition);
//    
//    NSMutableArray *conditions = [NSMutableArray array];
//    
//    do {
//        [conditions addObject:condition];
//    } while ((condition = va_arg(args, NSCondition *)));
//    
//    va_end(args);
//    
//    NSCondition *overallCondition = [NSCondition new];
//    
//    for (int i = 0; i < conditions.count; i++) {
//        NSCondition *cond = [conditions objectAtIndex:i];
//        
//        async(^{
//            [cond lock];
//            [cond wait];
//            [cond unlock];
//            
//            [overallCondition lock];
//            [overallCondition signal];
//            [overallCondition unlock];
//        });
//    }
//    
//    for (int i = 0; i < conditions.count; i++) {
//        [overallCondition lock];
//        [overallCondition wait];
//        [overallCondition unlock];
//    }
//    
//    if (block)
//        block();
//}
@end

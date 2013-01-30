//
//  VimeoHelper.h
//  PlayVimeo
//
//  Created by Tan Nguyen on 1/30/13.
//  Copyright (c) 2013 East Agile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VimeoDelegate

- (void)finishedGetVimeoURL:(NSString *)url;
@end


@interface VimeoHelper : NSObject {

    UIWebView *_webView;
    id<VimeoDelegate> _delegate;
    NSURLConnection *_connection;
    NSString *_originUrl;
}

@property (strong, nonatomic) UIWebView *webView;
- (void)getVimeoRedirectUrlWithUrl:(NSString *)url delegate:(id<VimeoDelegate>)delegate;
@end
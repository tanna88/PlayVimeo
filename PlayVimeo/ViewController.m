//
//  ViewController.m
//  PlayVimeo
//
//  Created by Tan Nguyen on 1/30/13.
//  Copyright (c) 2013 East Agile. All rights reserved.
//
#import <MediaPlayer/MediaPlayer.h>
#import "ViewController.h"
#import "VimeoHelper.h"

@interface ViewController ()

@end
VimeoHelper *vimeoHelper;
MPMoviePlayerViewController *_moviePlayerController;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    vimeoHelper = [[VimeoHelper alloc] init];
    [vimeoHelper getVimeoRedirectUrlWithUrl:@"http://vimeo.com/52760742" delegate:(id<VimeoDelegate>)self];
    if IOS_OLDER_THAN_6 {
        [self.view addSubview:vimeoHelper.webView];
        vimeoHelper.webView.frame =  CGRectMake(0,0,0,0);
    }
}

- (void)finishedGetVimeoURL:(NSString *)url
{
    _moviePlayerController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:url]];
    [self presentViewController:_moviePlayerController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

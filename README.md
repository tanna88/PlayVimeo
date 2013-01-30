PlayVimeo
=========

Using VimeoHeler to generate direct vimeo url.

EX:

- (void)viewDidLoad

{
    [super viewDidLoad];

    vimeoHelper = [[VimeoHelper alloc] init];

    [self.view addSubview:vimeoHelper.webView];

    [vimeoHelper.webView setFrame:self.view.frame];

    [vimeoHelper getVimeoRedirectUrlWithUrl:@"http://vimeo.com/52760742" delegate:(id<VimeoDelegate>)self];

}

- (void)finishedGetVimeoURL:(NSString *)url

{
    _moviePlayerController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:url]];
    
    [self presentModalViewController:_moviePlayerController animated:YES];
    
}
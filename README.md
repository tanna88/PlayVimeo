PlayVimeo
=========

Using VimeoHelper to get vimeo url which can use to play in MPMoviePlayerViewController.
INSTALL
----
Copy VimeoHelper to your project

<pre>
#import 'vimeoHelper.h' to your ViewController
</pre>

HOW TO USE
----

For IOS6

<pre>
<code>
- (void)viewDidLoad
{
    [super viewDidLoad];
    vimeoHelper = [[VimeoHelper alloc] init];
    [vimeoHelper getVimeoRedirectUrlWithUrl:@"http://vimeo.com/52760742" delegate:(id<VimeoDelegate>)self];
}

- (void)finishedGetVimeoURL:(NSString *)url
{
    _moviePlayerController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:url]];
    [self presentViewController:_moviePlayerController animated:NO completion:nil];
}
</code>
</pre>


For IOS5
<pre>
<code>
#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
</code>
</pre>

<pre>
<code>
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
</code>
</pre>

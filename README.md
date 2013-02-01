PlayVimeo
=========

Using VimeoHeler to generate direct vimeo url.
'''INSTALL'''
----
Copy VimeoHelper to your project
#import 'vimeoHelper.h' to your ViewController

'''HOW TO USE'''
For IOS6
----
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
----
For IOS5
----
#define IOS_OLDER_THAN_6 ( [ [ [ UIDevice currentDevice ] systemVersion ] floatValue ] < 6.0 )
...

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
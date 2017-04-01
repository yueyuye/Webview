//
//  LvesViewController.m
//  WebViewDemo
//
//  Created by Lves Li on 14-8-15.
//  Copyright (c) 2014年 Lves. All rights reserved.
//

#import "LvesViewController.h"
#import "LvesOriginalController.h"
@interface LvesViewController ()<UIWebViewDelegate>

@end

@implementation LvesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"资讯";
    //1. 清除顶部滚动
    [self clearWebViewBackground:self.myWebView];
    
    //2. 设置代理
    self.myWebView.delegate=self;
    //3. 加载webView
    [self loadMyWebView];
    
    
	
}
#pragma mark 去除webView滚动顶部和底部的白边
- (void)clearWebViewBackground:(UIWebView *)webView
{
    UIWebView *web = webView;
    for (id v in web.subviews) {
        if ([v isKindOfClass:[UIScrollView class]]) {
            [v setBounces:NO];
        }
    }
}

#pragma mark 加载WebView
-(void) loadMyWebView{
    NSString *title=@"韩寒《后会无期》奇葩的吸金3秘籍";
    
    NSString *linkStr=[NSString stringWithFormat:@"<a href='%@'>我的博客</a> <a href='%@'>原文</a>",@"https://www.baidu.com",@"https://www.baidu.com"];
    
    NSString *p1=@"韩寒《后会无期》的吸金能力很让我惊讶！8月12日影片票房已成功冲破6亿大关。而且排片量仍保持10 以上，以日收千万的速度稳步向七亿进军。";
    
    NSString *p2=@"要知道，《后会无期》不是主流类型片，是一个文艺片。不像《小时代》，是一个商业主流的偶像电影。";
    NSString *image1=[NSString stringWithFormat:@"<img src='%@'  height='280' width='300' />",@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2463137040,3996439793&fm=206&gp=0.jpg"];
    NSString *image2=[NSString stringWithFormat:@"<img src='%@'  height='280' width='300' />",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490261148170&di=f8b32a2446fb12d710ba6090d45993df&imgtype=0&src=http%3A%2F%2Fscimg.jb51.net%2Fallimg%2F160815%2F103-160Q509544OC.jpg"];
    
    NSString *p3=@"太奇葩了！有人说，这是中国电影市场的红利，是粉丝电影的成功。但是，有一部投资3000万的粉丝电影《我就是我》，有明星，制作也不错，基本上是惨败。";
    
    NSString *image3=[NSString stringWithFormat:@"<img src='%@'  height='400' width='300' />",@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=371997686,996679946&fm=206&gp=0.jpg"];

    NSString *p4=@"《后会无期》卖的不是好故事，是优越感。特别是针对80、90后的人群，你有没有发现，看《后会无期》比看《小时代3》有明显的优越感。故事虽然一般，但是很多人看完后，会在微博、微信上晒照片。所以说，对一个族群靠的不是广度，而是深度。<br>\
    \
    很凶残，值得大家借鉴。韩寒《后会无期》还有什么秘密武器，欢迎《后会无期》团队或相关方爆料，直接留言即可，有料的可以送黎万强亲笔签名的《参与感》一书。";
    
    //初始化和html字符串
    NSString *htmlURlStr=[NSString stringWithFormat:@"<body style='background-color:#EBEBF3'><h2>%@</h2><p>%@</p> <p>%@ </p>%@ <br><p> %@</p> %@ <p>%@</p>%@<p>%@</p></body>",title,linkStr,p1,image1,p2,image3,p3,image2,p4];
    
    [self.myWebView loadHTMLString:htmlURlStr baseURL:nil];

}



#pragma mark - WebViewDelegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    NSString *urlStr=request.URL.absoluteString;
    
    NSLog(@"url: %@",urlStr);
    
    //为空，第一次加载本页面
    if ([urlStr isEqualToString:@"about:blank"]) {
        return YES;
    }
    
    //设置点击后的视图控制器
    LvesOriginalController *originalC=[[LvesOriginalController alloc] init];
    originalC.originUrl=urlStr; //设置请求连接
    //跳转到点击后的控制器并加载webview
    [self.navigationController pushViewController:originalC animated:YES];
    
    return  NO;
}
//设置底部滚动不弹回
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSInteger height = [[webView stringByEvaluatingJavaScriptFromString:@"document.body.offsetHeight;"] intValue];
//    NSString* javascript = [NSString stringWithFormat:@"window.scrollBy(0, %ld);", height];
   // [webView stringByEvaluatingJavaScriptFromString:javascript];

}



@end

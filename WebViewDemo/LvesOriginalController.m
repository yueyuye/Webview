//
//  LvesOriginalController.m
//  WebViewDemo
//
//  Created by Lves Li on 14-8-15.
//  Copyright (c) 2014年 Lves. All rights reserved.
//

#import "LvesOriginalController.h"

@interface LvesOriginalController ()
{
    UIWebView *_webView;
}
@end

@implementation LvesOriginalController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置title
    self.title=@"原文";
    
    
    _webView=[[UIWebView alloc] init];
    _webView.frame=[[UIScreen mainScreen] bounds];
    
    [self.view addSubview:_webView];
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.originUrl]]];
    
    
}



@end

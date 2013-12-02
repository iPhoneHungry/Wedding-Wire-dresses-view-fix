//
//  ViewController.m
//  weddingwire2
//
//  Created by iPhoneHungry@yahoo.com on 11/27/13.
//  Copyright (c) 2013 rezand. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


// cookie info set in AppDelegate "didFinishLaunchingWithOptions"


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.homeWebView.delegate = self;
    
    //Turn that nasty bounce off below and make app actually act like a app.
    self.homeWebView.scrollView.bounces = NO;
    
    //Turning off scrolls to top just in case even though url bar isnt shown.
    self.homeWebView.scrollView.scrollsToTop = NO;
    
    NSURL * openingURL = [NSURL URLWithString:@"http://m.weddingwire.com/wedding-photos/dresses/results?tags%5B%5D=dress-price-700-and-under"];
    
    NSURLRequest *mainMenuRequest = [NSURLRequest requestWithURL:openingURL];
    
    
    [self.homeWebView loadRequest:mainMenuRequest];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSLog(@"Page Loaded");
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"Hey some scrolling to the top happened!");
}
@end

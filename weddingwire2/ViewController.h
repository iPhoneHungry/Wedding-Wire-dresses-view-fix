//
//  ViewController.h
//  weddingwire2
//
//  Created by iPhoneHungry@yahoo.com on 11/27/13.
//  Copyright (c) 2013 rezand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWebView.h"

@interface ViewController : UIViewController <UIWebViewDelegate, UIScrollViewDelegate>
{
    int scrollPosition;
}

@property (weak, nonatomic) IBOutlet MyWebView *homeWebView;


@end

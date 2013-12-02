//
//  MyWebView.h
//  weddingwire2
//
//  Created by iPhoneHungry@yahoo.com on 11/27/13.
//  Copyright (c) 2013 rezand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyWebView : UIWebView <UIScrollViewDelegate>
{
  //Hidden iVars? what's he up to..
}
@property (assign) float previousScrolly;

//BOOL named the same as AppDelegate BOOL such a naughty thanksgiving weekend.
@property (assign) BOOL iosVersionNot7;

@end

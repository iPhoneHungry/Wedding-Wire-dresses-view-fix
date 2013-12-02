//
//  MyWebView.m
//  weddingwire2
//
//  Created by iPhoneHungry@yahoo.com on 11/27/13.
//  Copyright (c) 2013 rezand. All rights reserved.
//

#import "MyWebView.h"
#import "AppDelegate.h"


@implementation MyWebView

@synthesize previousScrolly = _previousScrolly;
@synthesize iosVersionNot7 = _iosVersionNot7;


// I ran this baseInit out of spite so feel free to skip ahead two methods
- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

-(void)baseInit{
    _previousScrolly = 0.0;
    
    // Setting this BOOL to NO for test purposes but for best
    // chances to protect against glitch should assume not ios 7
    _iosVersionNot7 = NO;
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _iosVersionNot7 = appDelegate.iosVersionNot7;
    
    
    NSLog(@"baseInit ints %f",_previousScrolly);
    
    // The appdelegate private methods return 6.1.3 for me
    // and the below variable returns YES
    NSLog( _iosVersionNot7 ? @"YES" : @"NO");
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // uncomment below if you want to read the word dragging a 1000 times.
    
   //  NSLog(@"dragging..");
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    //this really won't be called with a hidden url bar but was here for testing purposes.
    NSLog(@"scrolled to top");
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView   {
 
    if (self.iosVersionNot7 == YES) {
        //ios is below 7.0 so checking to block glitch
   
       if (scrollView.contentOffset.y > 60) {
     
            if (self.previousScrolly > 2.0) {
        
               // below if to check for dramatic y change
               if (scrollView.contentOffset.y < (self.previousScrolly / 2)) {
                   
                // blocks dresses webpage from forcing to top randomly
                  NSLog(@"Scroll Denied");
                  scrollView.contentOffset = CGPointMake(0.0, self.previousScrolly);
               }
            }
         // save current y move to become old y
        self.previousScrolly = scrollView.contentOffset.y;
      }
   }
}

@end

fighting with javascript. I think a update to their mobile site added even more javascript to corrupt this on older ios phones below 7 again. Simply needs a better api on server end, or parsing through the data on the app end.

Wedding-Wire-dresses-view-fix
=============================

-Demonstrates code to fix scroll issue in wedding wire while viewing dresses page in app with ios below 7.

-The issue is not in ios 7.4, viewing mobile page on OSX or Safari ios 6.1.3 but only UIWebView for ios 6.1.3 and below.

-Created with XCode 4.6 and has not been tested on XCode 5 yet though the bug was not on ios 7.

Viewing http://m.weddingwire.com/wedding-photos/dresses/results?tags%5B%5D=dress-price-700-and-under in UIWebView was 
used for this example though other pages were creating the issue for app users as well.

The main snippit of code that fixes the issue will be found in the UIWebView subclass MyWebView which is:

 ```
   -(void)scrollViewDidScroll:(UIScrollView *)scrollView   
   {
 
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
 ```
 

Hopefully this will help a few coders out there managing webapps built into native applications.

Additional uses for the full source could be for any one trying to learn how to..

- Add preset cookies for thier app which is shown in the AppDelegate.m 
- Retrieve variable value from AppDelegate in another class "Common stackoverflow.com question..."
- Shows example of initWithCoder and baseInit in UIWebView.
- How to almost over comment code.

Any questions I'm always out there iphonehungry@yahoo.com http://stackoverflow.com/users/2269488/rezand http://www.imagegarageapp.com

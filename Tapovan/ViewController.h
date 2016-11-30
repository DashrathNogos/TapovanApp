//
//  ViewController.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 20/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPageVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "RegisterVC.h"
#import "AppDelegate.h"
#import "Reachability.h"
@interface ViewController : UIViewController
{
    __weak IBOutlet UIView *textView;
    __weak IBOutlet UIButton *btnLogin;
    __weak IBOutlet UIButton *btnFbLogin;
    NSString *strmobileNo,*strId;
    NSString *accessTocken,*profile_status;
    AppDelegate *appDelegate;
    NSString *s;
    UIActivityIndicatorView  *av;
    

}
- (IBAction)btnLoginClicked:(id)sender;
- (IBAction)btnSignUpClicked:(id)sender;
- (IBAction)btnForgotPasswordClicked:(id)sender;
- (IBAction)btnFbLoginClicked:(id)sender;

@end


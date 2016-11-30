//
//  RegisterVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 26/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AFHTTPRequestOperationManager.h"
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;
@interface RegisterVC : UIViewController
{
    
    __weak IBOutlet UIView *textfieldMenu;
    IBOutlet UITextField *txtFullname,*txtEmailAdd,*txtPassword,*txtConfirmPass;
    
    __weak IBOutlet UIButton *btnRegister;
    AppDelegate *appDelegate;
    CGFloat animatedDistance;
    UIActivityIndicatorView *av;
    NSString *strToken;
    
}
@property(strong,nonatomic)NSString *strAppId,*strNumber,*strEditProfile;

- (IBAction)btnRegisterCliced:(id)sender;
- (IBAction)btnBackClicked:(id)sender;

@end

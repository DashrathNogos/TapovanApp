//
//  DonationVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MainPageVC.h"
#import "StudentCornerVC.h"
#import <AccountKit/AccountKit.h>
#import "PUUIPaymentOptionVC.h"
#import "PUUIWrapperPayUSDK.h"
#import "iOSDefaultActivityIndicator.h"
#import "PUSAHelperClass.h"
#import "PUVAOptionsVC.h"

@interface DonationVC : UIViewController
{
    IBOutlet UIButton *btnMenu;
    IBOutlet UIImageView *sideProfileImg;
    BOOL isShown;
    __weak IBOutlet UILabel *lblProfileName;
    AppDelegate *appDelegate;
    NSArray *arrName,*arrImg;
    IBOutlet UIView *mainView;
    CGRect screenRect;
    AKFAccountKit *_accountKit;
    IBOutlet UITextField *txtPrize;
    IBOutlet UIButton *btnPayment;
    NSString *randomTransactionId;
    PayUModelPaymentParams *paymentParam;
    IBOutlet UIButton *btn1,*btn2,*btn3;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *sidebarImg;
@property (strong, nonatomic) IBOutlet UITableView *tblSideView;
@property (strong, nonatomic) PayUWebServiceResponse *webServiceResponse;
@property (strong, nonatomic) iOSDefaultActivityIndicator *defaultActivityIndicator;
- (IBAction)btnSidemenu:(id)sender;
- (IBAction)btnsideClose:(id)sender;
- (IBAction)btnEditProfile:(id)sender;
- (IBAction)btnPayment:(id)sender;
- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;

@end

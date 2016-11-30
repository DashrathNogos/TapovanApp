//
//  NotificationVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 09/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AccountKit/AccountKit.h>
#import "AppDelegate.h"
@interface NotificationVC : UIViewController{
    NSArray *arrName,*arrImg;
    BOOL isShown;
    CGRect screenRects;
    AKFAccountKit *_accountKit;
    AppDelegate *appDelegate;
    
    IBOutlet UIView *menuView;
}
@property (strong, nonatomic) IBOutlet UITableView *tblsideMenu;

@property (strong, nonatomic) IBOutlet UITableView *tblNotification;
@property (strong, nonatomic) IBOutlet UIImageView *btnSideImg;

@property (strong, nonatomic) IBOutlet UIButton *btnCloseMenu;
- (IBAction)btnSideMenuClicked:(id)sender;
- (IBAction)btnSidemenuCloseClicked:(id)sender;

@end

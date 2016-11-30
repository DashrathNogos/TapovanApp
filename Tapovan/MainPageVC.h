//
//  MainPageVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 26/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "AppDelegate.h"
#import "ActivityVC.h"
#import "DonationVC.h"
#import "ViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "NotificationVC.h"
#import "RegisterVC.h"
@interface MainPageVC : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UITableViewDelegate, UITableViewDataSource>
{
    __weak IBOutlet UIImageView *blureImage;
    IBOutlet UIImageView *profileImage;
    
    NSString *strmobileNo,*strId;
    AppDelegate *appDelegate;
    IBOutlet UIButton *btnMenu;
    NSMutableData *allData;
    NSString *accessTocken,*profile_status,*strToken,*g,*s,*o;
    IBOutlet UIImageView *sideProfileImg;
    NSArray *arrName,*arrImg;
    BOOL isShown;
    UIView *overlayBGView;
    IBOutlet UIView *mainView;
    CGRect screenRect;
    IBOutlet UIActivityIndicatorView *progress;
    UIImage *strImg;
    IBOutlet UILabel *lblUserName,*lblUserDesc;

    IBOutlet UILabel *lblSidebarName;
}
- (IBAction)btnCameraClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tblSideView;
@property (nonatomic, copy) NSString *accountKitState,*strUserName;
@property (nonatomic, strong) NSLayoutConstraint *aspectRatio;

- (IBAction)btnSideMenu:(id)sender;
- (IBAction)btnsideClose:(id)sender;
- (IBAction)btnEditProfile:(id)sender;
- (IBAction)btnGurukulCorner:(id)sender;
- (IBAction)btnSchoolCorner:(id)sender;
- (IBAction)btnOtherCorner:(id)sender;
- (IBAction)btnDonationClicked:(id)sender;

@end

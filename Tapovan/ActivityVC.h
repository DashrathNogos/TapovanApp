//
//  ActivityVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 27/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DonationVC.h"
#import "MainPageVC.h"
#import "GurukulVC.h"
#import "SchoolVC.h"
#import "OtherVC.h"
#import <AccountKit/AccountKit.h>

@interface ActivityVC : UIViewController<UIScrollViewDelegate>
{
    AppDelegate *appDelegate;
    IBOutlet UIButton *btnMenu;
    IBOutlet UIImageView *sideProfileImg;
    
    IBOutlet UILabel *lblTitle;
    UIView *v1,*v2;
    
    __weak IBOutlet UIView *gurukulView,*schoolView,*otherView,*homeView,*mgurukulView,*mschoolView,*motherView,*navigationView,*mainView;
     __weak IBOutlet UIButton *btngurukul,*btnschool,*btnother;
      __weak IBOutlet UIImageView *imggurukul,*imgschool,*imgother;
    NSArray *arrName,*arrImg,*btnArray;
    BOOL isShown;
    UISwipeGestureRecognizer * _leftSwipeGestureRecognizer,*_rightSwipeGestureRecognizer;
    CGRect screenRect;
    AKFAccountKit *_accountKit;

   
    IBOutlet UIScrollView *menuScrollView;
    IBOutlet UILabel *lblSidebarName;
    
    
}
 


@property (strong, nonatomic) IBOutlet UITableView *tblSideView;
@property(strong,nonatomic)NSString *strG,*strS,*strO;
-(void) addChildViewControllersOntoContainer:(NSArray *)controllersArr;


- (IBAction)btnSidemenu:(id)sender;
- (IBAction)btnsideClose:(id)sender;
- (IBAction)btnEditProfile:(id)sender;
- (IBAction)btnGurukulClicked:(id)sender;
- (IBAction)btnSchoolCliked:(id)sender;
- (IBAction)btnotherClicked:(id)sender;
@end

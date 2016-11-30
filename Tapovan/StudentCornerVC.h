//
//  StudentCornerVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainPageVC.h"
#import "ActivityVC.h"
#import <AccountKit/AccountKit.h>

@interface StudentCornerVC : UIViewController<UIScrollViewDelegate>
{
    IBOutlet UIImageView *sideProfileImg;
    IBOutlet UIView *mainView;
    NSArray *arrName,*arrImg;
    BOOL isShown;
    AppDelegate *appDelegate;
    CGRect screenRect;
    AKFAccountKit *_accountKit;



}
@property (strong, nonatomic) IBOutlet UICollectionView *collView;
@property (strong, nonatomic) IBOutlet UITableView *tblSideView;
- (IBAction)btnSideMenu:(id)sender;
- (IBAction)btnsideClose:(id)sender;
- (IBAction)btnEditProfile:(id)sender;
@end

//
//  GurukulVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 02/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCell.h"
#import "TitleGurukulCell.h"
#import "MultipleImageCell.h"
#import "VideoGurukulCell.h"
#import "YTPlayerView.h"
#import "AppDelegate.h"
#import "ImageDetailVC.h"
@interface GurukulVC : UIViewController<UIScrollViewDelegate,YTPlayerViewDelegate>
{
    NSMutableArray *arrType,*arrTitle,*getTitle,*getDesc,*getVideo,*getimg,*getDate;
    NSMutableArray *arrCount;
    NSString *strType,*strToken;
    UIScrollView *scrollView;
    NSDictionary *dicImg;
    NSMutableDictionary *dicData;
    AppDelegate *appDelegate;
    UIAlertView *alt;
    NSArray* imgMultiple;
    NSString *simgTitle,*simgDescr;
    NSArray *arrMoreImg;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblGurukul;

@end

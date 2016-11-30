//
//  OtherVC.h
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
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AppDelegate.h"
#import "ImageDetailVC.h"
@interface OtherVC : UIViewController<YTPlayerViewDelegate>
{
    NSMutableArray *arrType,*arrTitle,*getTitle,*getDesc,*getVideo,*getimg,*getDate;
    NSMutableArray *arrCount;
    NSString *strType,*strToken;
    AppDelegate *appDelegate;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblOther;

@end

//
//  SchoolVC.h
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
#import "AppDelegate.h"
#import "ImageDetailVC.h"
@interface SchoolVC : UIViewController<YTPlayerViewDelegate>
{
    NSMutableArray *arrType,*arrTitle,*getTitle,*getDesc,*getVideo,*getimg,*getDate;
    NSMutableArray *arrCount;
    NSString *strType,*strToken;
    AppDelegate *appDelegate;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tblSchool;

@end

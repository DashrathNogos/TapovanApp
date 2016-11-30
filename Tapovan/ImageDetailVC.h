//
//  ImageDetailVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoDetailCell.h"
#import "AFImageViewer.h"
@interface ImageDetailVC : UIViewController<YTPlayerViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UILabel *lblTitle;
    
    IBOutlet UILabel *lblDescri;
    IBOutlet UIView *viewImg,*titleDesView;
    NSMutableArray *arrUrl;
    IBOutlet UIImageView *SingleImag;
    IBOutlet UILabel *lblSingleImgTitle,*lblSingleImgDes;
    IBOutlet AFImageViewer *ScrollImg;
    IBOutlet UIView *videoDetailView;
    IBOutlet UILabel *lblTileVideo,*lblTitleDescription;
    UIImageView *bigImage;
    BOOL tap;
    
    IBOutlet UIScrollView *scroll;
    NSMutableArray *objectarray;
}
@property(strong,nonatomic)NSArray *arrImg,*arrVideo;
@property(strong,nonatomic)NSString *strTitle,*strDes;
@property (strong, nonatomic) IBOutlet UITableView *tblVideo;

- (IBAction)btnBackClicked:(id)sender;

@end

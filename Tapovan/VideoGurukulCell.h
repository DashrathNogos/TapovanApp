//
//  VideoGurukulCell.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
@interface VideoGurukulCell : UITableViewCell<YTPlayerViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIWebView *web;
@property (strong, nonatomic) IBOutlet UILabel *lblDescriptionVideo;
@property (strong, nonatomic) IBOutlet UIView *VideoView;
@property (strong, nonatomic) IBOutlet YTPlayerView *ytdPlayer;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@end

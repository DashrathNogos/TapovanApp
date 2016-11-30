//
//  VideoDetailCell.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"
@interface VideoDetailCell : UITableViewCell<YTPlayerViewDelegate>
@property (strong, nonatomic) IBOutlet YTPlayerView *video;
@property (strong, nonatomic) IBOutlet UIView *videoView;

@end

//
//  VideoDetailCell.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "VideoDetailCell.h"

@implementation VideoDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _video.delegate=self;
    _videoView.layer.cornerRadius=7;
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  VideoGurukulCell.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "VideoGurukulCell.h"

@implementation VideoGurukulCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _VideoView.layer.cornerRadius=7;
    _ytdPlayer.delegate=self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

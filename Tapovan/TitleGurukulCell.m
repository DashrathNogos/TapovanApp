//
//  TitleGurukulCell.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "TitleGurukulCell.h"

@implementation TitleGurukulCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _TitleView.layer.cornerRadius=7;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

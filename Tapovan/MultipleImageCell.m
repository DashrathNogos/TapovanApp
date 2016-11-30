//
//  MultipleImageCell.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "MultipleImageCell.h"

@implementation MultipleImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _img1.layer.borderWidth=2;
    _img2.layer.borderWidth=2;
    _img3.layer.borderWidth=2;
    _img1.layer.borderColor=[UIColor whiteColor].CGColor;
    _img2.layer.borderColor=[UIColor whiteColor].CGColor;
    _img3.layer.borderColor=[UIColor whiteColor].CGColor;
    _multipleImgView.layer.cornerRadius=7;
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

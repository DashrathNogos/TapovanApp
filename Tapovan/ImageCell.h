//
//  ImageCell.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *singleImg;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIView *SingleImgCell;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@end

//
//  MultipleImageCell.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 03/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultipleImageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *img1;
@property (strong, nonatomic) IBOutlet UIImageView *img2;
@property (strong, nonatomic) IBOutlet UIImageView *img3;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIButton *btnCount;
@property (strong, nonatomic) IBOutlet UIButton *btnOne;
@property (strong, nonatomic) IBOutlet UIButton *btnSecond;
@property (strong, nonatomic) IBOutlet UILabel *lblPhoto;
@property (strong, nonatomic) IBOutlet UIView *multipleImgView;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@end

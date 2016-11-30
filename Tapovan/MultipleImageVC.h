//
//  MultipleImageVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 10/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageDetailVC.h"
@interface MultipleImageVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
    IBOutlet UICollectionView *CollView;
    
    IBOutlet UIView *ViewImg;
}
@end

//
//  ScreenVC.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSplashIcon.h"
#import "MainPageVC.h"
@interface ScreenVC : UIViewController<SKSplashDelegate>
{
    AppDelegate *appDelegate;

}
@property (strong, nonatomic) SKSplashView *splashView;
@property (strong, nonatomic) UIActivityIndicatorView *indicatorView;

@end

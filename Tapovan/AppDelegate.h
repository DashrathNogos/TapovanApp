//
//  AppDelegate.h
//  Tapovan
//
//  Created by Jimit Bagadiya on 20/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.width

#define PKWaitDelay(dly, block)     dispatch_after(dispatch_time(DISPATCH_TIME_NOW,dly*100000),dispatch_get_current_queue(), ^{ block })

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIImage *strProfileimg;
@property (strong, nonatomic) NSMutableString *strTocken;
@property(strong,nonatomic)NSUserDefaults *user;
@property(strong,nonatomic)NSArray *arrVideo;
@property (weak, nonatomic) UIViewController *paymentOptionVC;
@property (strong, nonatomic) UIImageView *splashView;
@property(nonatomic,strong)NSMutableString *strEmail,*strMobile,*strName,*strImg;




@end


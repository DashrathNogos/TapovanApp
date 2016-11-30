//
//  PUUIPaymentOptionVC.h
//  PayUNonSeamlessTestApp
//
//  Created by Umang Arya on 30/12/15.
//  Copyright © 2015 PayU. All rights reserved.
//

#import "PUUIWrapperKHTabPagerVC.h"
#import "PUUIWrapperPayUSDK.h"
#import "AppDelegate.h"
#import "AFHTTPRequestOperationManager.h"

@interface PUUIPaymentOptionVC : PUUIWrapperKHTabPagerVC
{
    NSString *strToken,*strUserData;
    AppDelegate *appDelegate;
    
}

@property (nonatomic, strong) PayUModelPaymentParams *paymentParam;
@property (nonatomic, strong) PayUModelPaymentRelatedDetail *paymentRelatedDetail;

@property (nonatomic, strong) NSArray *paymentOption;
@end

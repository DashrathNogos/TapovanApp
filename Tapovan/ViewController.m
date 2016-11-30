//
//  ViewController.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 20/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "ViewController.h"
#import <AccountKit/AccountKit.h>
#import "AdvancedUIManager.h"
#import "Themes.h"
@interface ViewController ()<AKFViewControllerDelegate>

@end

@implementation ViewController
{
    
    AKFAccountKit *_accountKit;
    AdvancedUIManager *_advancedUIManager;
    NSString *_authorizationCode;
    BOOL _enableSendToFacebook;
    NSString *_inputState;
    NSString *_outputState;
    UIViewController<AKFViewController> *_pendingLoginViewController;
    BOOL _showAccountOnAppear;
    AKFTheme *_theme;
    ThemeType _themeType;
    BOOL _useAdvancedUIManager;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationItem setHidesBackButton:YES animated:YES];

    textView.layer.cornerRadius=3;
    btnLogin.layer.cornerRadius=3;
    btnFbLogin.layer.cornerRadius=4;
    btnFbLogin.layer.borderWidth=2;
    btnFbLogin.layer.borderColor=[UIColor whiteColor].CGColor;
    

    _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
    
    
    _showAccountOnAppear = ([_accountKit currentAccessToken] != nil);
    _pendingLoginViewController = [_accountKit viewControllerForLoginResume];
    _enableSendToFacebook = YES;
    
    
    [self _updateThemeType:_themeType];
    [self _updateEntryButtonType:_advancedUIManager.entryButtonType];
    [self _updateConfirmButtonType:_advancedUIManager.confirmButtonType];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
   av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    av.frame = CGRectMake(round((self.view.frame.size.width - 40) / 2), round((self.view.frame.size.height - 40) / 2), 40, 40);
    av.tag  = 1;
    av.backgroundColor=[UIColor whiteColor];
    av.layer.cornerRadius=10;
    
    
    [self.view addSubview:av];


}

/*NSURLRequest *postRequest = [[BLAPIClient sharedClient] multipartFormRequestWithMethod:@"POST"
path:@"/lattes"
parameters:params
constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileData:self.photoData
                                name:@"latte[photo]"
                            fileName:@"latte.png"
                            mimeType:@"image/png"];
 }];     [formData appendPartWithFileData:imageData name:@"avatar" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];
*/
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       if (_showAccountOnAppear) {
        _showAccountOnAppear = NO;
//        [self _presentWithSegueIdentifier:@"main" animated:animated];
    } else if (_pendingLoginViewController != nil) {
        [self _prepareLoginViewController:_pendingLoginViewController];
        [self presentViewController:_pendingLoginViewController animated:animated completion:NULL];
        _pendingLoginViewController = nil;
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *destinationViewController = segue.destinationViewController;
    if ([destinationViewController isKindOfClass:[MainPageVC class]]) {
        ((MainPageVC *)destinationViewController).accountKitState = _outputState;
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (![identifier isEqualToString:@"showEntryButtonTypeList"] &&
        ![identifier isEqualToString:@"showConfirmButtonTypeList"]) {
        return YES;
    }
    
    return _useAdvancedUIManager;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLoginClicked:(id)sender {
    

}

- (IBAction)btnSignUpClicked:(id)sender {
    [self performSegueWithIdentifier:@"registerPage" sender:self];

}

- (IBAction)btnForgotPasswordClicked:(id)sender {
}

- (IBAction)btnFbLoginClicked:(id)sender {
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable)
    {
        //connection unavailable
        UIAlertView *net=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [net show];
        
    }
    else
    {
        //connection available
       

    UIViewController<AKFViewController> *viewController = [_accountKit viewControllerForPhoneLoginWithPhoneNumber:nil
                                                                                                            state:_inputState];
    viewController.enableSendToFacebook = _enableSendToFacebook;
    [self _prepareLoginViewController:viewController];
    [self presentViewController:viewController animated:YES completion:NULL];
    
    }
}



- (void)viewController:(UIViewController<AKFViewController> *)viewController didCompleteLoginWithAccessToken:(id<AKFAccessToken>)accessToken state:(NSString *)state
{
    AKFAccountKit *_accountKits;

    _outputState = [state copy];
    if (!_accountKits) {
        _accountKits = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
        [av startAnimating];

        [_accountKits requestAccount:^(id<AKFAccount> account, NSError *error) {
            strId = account.accountID;
            if ([account.emailAddress length]) {
                //self.titleLabel.text = @"Email Address";
                //self.valueLabel.text = account.emailAddress;
            } else if ([account phoneNumber]) {
                //self.titleLabel.text = @"Phone Number";
                strmobileNo = [[account phoneNumber] stringRepresentation];

                [self LoginApi];
                
            }
        }];
    }

}

- (void)viewController:(UIViewController<AKFViewController> *)viewController didCompleteLoginWithAuthorizationCode:(NSString *)code state:(NSString *)state
{
    _authorizationCode = [code copy];
    _outputState = [state copy];
    
//    if (!_accountKit) {
//        _accountKit = [[AKFAccountKit alloc] initWithResponseType:AKFResponseTypeAccessToken];
//        [_accountKit requestAccount:^(id<AKFAccount> account, NSError *error) {
//            strId = account.accountID;
//            if ([account.emailAddress length]) {
//                //self.titleLabel.text = @"Email Address";
//                //self.valueLabel.text = account.emailAddress;
//            } else if ([account phoneNumber]) {
//                //self.titleLabel.text = @"Phone Number";
//                strmobileNo = [[account phoneNumber] stringRepresentation];
//                [self LoginApi];
//                
//            }
//        }];
//    }
//
    
    //[self _presentWithSegueIdentifier:@"main" animated:NO];
    
    //  [self _presentWithSegueIdentifier:@"showAuthorizationCode" animated:NO];
}
-(void)LoginApi{
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
NSDictionary *params = @{@"fb_id": strId,
                         @"mobile_number": strmobileNo};
[manager POST:@"http://tapovan.devdemoz.com/mobapi/fblogin" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    appDelegate.strTocken=[[NSMutableString alloc]init];
    appDelegate.strEmail=[[NSMutableString alloc]init];
    appDelegate.strName=[[NSMutableString alloc]init];
    appDelegate.strImg=[[NSMutableString alloc]init];
    appDelegate.strTocken=[[responseObject valueForKey:@"msg"]valueForKey:@"access_token"];
    profile_status=[responseObject valueForKey:@"profile_status"];
    
    
    
    [appDelegate.user setObject: appDelegate.strTocken forKey:@"firstName"];
   


    NSLog(@"JSON: %@", appDelegate.strTocken);
    NSLog(@"JSON: %@", profile_status);
    
    NSLog(@"JSON: %@", responseObject);
    [av stopAnimating];

    if ([profile_status isEqualToString:@"N"]) {
        RegisterVC *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
        rvc.strAppId=strId;
        rvc.strNumber=strmobileNo;
        [self.navigationController pushViewController:rvc animated:YES];

    }
    else if ([profile_status isEqualToString:@"Y"]){
        
        appDelegate.strEmail=[responseObject valueForKey:@"email"];
        appDelegate.strName=[responseObject valueForKey:@"name"];
        appDelegate.strMobile=[responseObject valueForKey:@"mobile_number"];
        appDelegate.strImg=[responseObject valueForKey:@"profile_image"];
        //profile_status=[responseObject valueForKey:@"profile_status"];
        [appDelegate.user setObject: appDelegate.strEmail forKey:@"Email"];
        [appDelegate.user setObject: appDelegate.strName forKey:@"Name"];
        [appDelegate.user setObject: appDelegate.strImg forKey:@"Images"];
        [appDelegate.user setObject: appDelegate.strMobile forKey:@"Mobile"];
        MainPageVC *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
        [self.navigationController pushViewController:rvc animated:YES];
    }else{
        
    }
    
    
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    [av stopAnimating];

}];
}


- (void)viewController:(UIViewController<AKFViewController> *)viewController didFailWithError:(NSError *)error
{
    NSLog(@"%@ did fail with error: %@", viewController, error);
}

#pragma mark - ConfigOptionListViewControllerDelegate

- (void)_ensureAdvancedUIManager
{
    if (_advancedUIManager == nil) {
        _advancedUIManager = [[AdvancedUIManager alloc] init];
    }
}

- (NSString *)_labelForButtonType:(AKFButtonType)buttonType
{
    switch (buttonType) {
        case AKFButtonTypeDefault:
            return @"Default";
        case AKFButtonTypeBegin:
            return @"Begin";
        case AKFButtonTypeConfirm:
            return @"Confirm";
        case AKFButtonTypeContinue:
            return @"Continue";
        case AKFButtonTypeLogIn:
            return @"Log In";
        case AKFButtonTypeNext:
            return @"Next";
        case AKFButtonTypeOK:
            return @"OK";
        case AKFButtonTypeSend:
            return @"Send";
        case AKFButtonTypeStart:
            return @"Start";
        case AKFButtonTypeSubmit:
            return @"Submit";
    }
}

- (void)_prepareLoginViewController:(UIViewController<AKFViewController> *)loginViewController
{
    loginViewController.advancedUIManager = _useAdvancedUIManager ? _advancedUIManager : nil;
    loginViewController.delegate = self;
//    loginViewController.theme = _theme;
    
    AKFTheme *theme = [AKFTheme defaultTheme];
   theme.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:233.0/255.0 blue:218.0/255.0 alpha:5.0];
//    theme.backgroundColor=[UIColor colorWithRed:236.0/255.0 green:233.0/255.0 blue:218.0/255.0 alpha:5.0];
   // theme.backgroundColor=UIColorFromRGB(0xBC1128);
    theme.buttonBackgroundColor = [UIColor colorWithRed:59.0/255 green:88.0/255 blue:151.0/255 alpha:1.0];;
    theme.buttonBorderColor = [UIColor whiteColor];
   theme.buttonTextColor = [UIColor whiteColor];
    theme.headerBackgroundColor = [UIColor colorWithRed:59.0/255 green:88.0/255 blue:151.0/255 alpha:1.0];
//    theme.headerTextColor = [UIColor colorWithWhite:0.2 alpha:1.0];
//    theme.iconColor = [UIColor colorWithRed:1.0 green:0.0 blue:1.0 alpha:1.0];
//    theme.inputBackgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.5 alpha:1.0];
//    theme.inputBorderColor = [UIColor colorWithRed:0.2 green:0.0 blue:0.0 alpha:1.0];
    theme.inputTextColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    theme.statusBarStyle = UIStatusBarStyleDefault;
    theme.textColor = [UIColor colorWithRed:59.0/255 green:88.0/255 blue:151.0/255 alpha:1.0];
    theme.titleColor = [UIColor colorWithRed:59.0/255 green:88.0/255 blue:151.0/255 alpha:1.0];
    loginViewController.theme = theme;
    loginViewController.defaultCountryCode = @"IN";
    loginViewController.navigationItem.backBarButtonItem.enabled=NO;
    

}


- (void)_presentWithSegueIdentifier:(NSString *)segueIdentifier animated:(BOOL)animated
{
    if (animated) {
        [self performSegueWithIdentifier:segueIdentifier sender:nil];
    } else {
        [UIView performWithoutAnimation:^{
            [self performSegueWithIdentifier:segueIdentifier sender:nil];
        }];
    }
}

- (void)_updateEntryButtonType:(AKFButtonType)buttonType
{
    //self.currentEntryButtonTypeLabel.text = [self _labelForButtonType:buttonType];
    if (buttonType != AKFButtonTypeDefault) {
        [self _ensureAdvancedUIManager];
    }
    _advancedUIManager.entryButtonType = buttonType;
}

- (void)_updateThemeType:(ThemeType)themeType
{
    _themeType = themeType;
    AKFTheme *theme = [Themes themeWithType:themeType];
    if (_theme != nil){
        theme.headerTextType = _theme.headerTextType;
    }
    _theme = theme;
    // self.currentThemeLabel.text = [Themes labelForThemeType:themeType];
}

- (void)_updateConfirmButtonType:(AKFButtonType)buttonType
{
    // self.currentConfirmButtonTypeLabel.text = [self _labelForButtonType:buttonType];
    if (buttonType != AKFButtonTypeDefault) {
        [self _ensureAdvancedUIManager];
    }
    _advancedUIManager.confirmButtonType = buttonType;
}


@end

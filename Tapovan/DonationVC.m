//
//  DonationVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "DonationVC.h"
#define     PAYUALERT(T,M)                                      dispatch_async(dispatch_get_main_queue(), ^{[[[UIAlertView alloc] initWithTitle:T message:M delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show];});
@interface DonationVC ()

@end
static NSString * const pUUIStoryBoard = @"PUUIMainStoryBoard";
static NSString * const verifyAPIStoryBoard = @"PUVAMainStoryBoard";


@implementation DonationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=YES;
    
    txtPrize.autocapitalizationType = UITextAutocapitalizationTypeWords;
    
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
     arrName =[NSArray arrayWithObjects:@"Dashboard",@"Gurukul",@"School",@"Others",@"Donations",@"Logout", nil];
    
   arrImg =[NSArray arrayWithObjects:@"menu1.png",@"gurukul-sidebar.png",@"school-sidebar.png",@"other-sidebar.png",@"menu5.png",@"menu6.png", nil];
    
    screenRect = [[UIScreen mainScreen] bounds];

    _sidebarImg.layer.cornerRadius = 50;
    _sidebarImg.clipsToBounds = YES;
    _sidebarImg.layer.borderWidth = 2.0f;
    _sidebarImg.layer.borderColor = [UIColor whiteColor].CGColor;
   // sideProfileImg.image=appDelegate.strProfileimg;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [recognizer setNumberOfTapsRequired:1];
    //lblName.userInteractionEnabled = true;  (setting this in Interface Builder)
    [mainView addGestureRecognizer:recognizer];
//SidemenuImages
        CGRect screenRect1 = [[UIScreen mainScreen] bounds];

   
    
 UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, screenRect1.size.width, 50)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)];
    UIBarButtonItem *fixedSpaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceButton.width = 10.0;
    UIBarButtonItem *flexibleSpaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    toolbar.items = [NSArray arrayWithObjects:flexibleSpaceButton, doneButton, fixedSpaceButton, nil];
    [toolbar sizeToFit];
    txtPrize.inputAccessoryView = toolbar;
    //paymentcode
    [self initialSetup];
    [self initialSetupForViewInput];
    txtPrize.text=@"";

    btnPayment.layer.cornerRadius=10;
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    txtPrize.text=@"";
    self.navigationController.navigationBar.hidden=YES;
    
    
        appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSString *strLogin=[appDelegate.user stringForKey:@"Images"];
        [_sidebarImg setImageWithURL:[NSURL URLWithString:strLogin]
                       placeholderImage:[UIImage imageNamed:@"gender_profile.png"]];
        appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSString *strName=[appDelegate.user stringForKey:@"Name"];
        lblProfileName.text=strName;
    
    
    
}
NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

-(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    randomTransactionId=randomString;
    //Uz2EPYRW3L3jqde
    return randomString;
}

-(void)cancelNumberPad{
    txtPrize.text = @"";
    [txtPrize resignFirstResponder];
}

-(void)doneWithNumberPad{
    NSString *numberFromTheKeyboard = txtPrize.text;
    [txtPrize resignFirstResponder];
}
-(void)initialSetup{
    self.defaultActivityIndicator = [iOSDefaultActivityIndicator new];
}
-(void)initialSetupForViewInput{
    
    [self addPaymentResponseNotofication];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
- (IBAction)btnSidemenu:(id)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    if (!isShown)
    {
//

        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblSideView setFrame:CGRectMake(0, _tblSideView.frame.origin.y,screenRect.size.width-45, _tblSideView.frame.size.height)];
                         }
                         completion:^(BOOL finished){
                         }];
        
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [mainView setFrame:CGRectMake(screenRect.size.width-45, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        
        isShown = true;
    }else{
//        [txtPrize resignFirstResponder];

        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView .frame.size.width, mainView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        isShown = false;
        
    }
     [txtPrize resignFirstResponder];
}

- (IBAction)btnsideClose:(id)sender {
    [txtPrize resignFirstResponder];

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView .frame.size.width, mainView.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    isShown = false;
    
    // _tblSideView.hidden=YES;
}

- (void)tapAction:(id)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    isShown=false;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrName count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    UIButton *btnNotification=[[UIButton alloc]initWithFrame:(CGRectMake(screenRect.size.width-100, 7, 34, 34))];
    btnNotification.layer.cornerRadius = 17; // this value vary as per your desire
    btnNotification.clipsToBounds = YES;
    [btnNotification  setTintColor:[UIColor blackColor]];
    //[cell.contentView addSubview:btnNotification];
    
    if (indexPath.row==1) {
        btnNotification.backgroundColor=[UIColor redColor];
        [btnNotification setTitle:@"10" forState:(UIControlStateNormal)];
        btnNotification.alpha=0.5;
        
        
    }else if (indexPath.row==2){
        [btnNotification setBackgroundColor: [UIColor colorWithRed:(66/255.0) green:(193/255.0) blue:(176/255.0) alpha:1.0]];
        [btnNotification setTitle:@"22" forState:(UIControlStateNormal)];
        
        
    }else if (indexPath.row==3){
        btnNotification.backgroundColor=[UIColor redColor];
        [btnNotification setTitle:@"8" forState:(UIControlStateNormal)];
        btnNotification.alpha=0.5;
        
        
    }
    

    UIImageView *img=[[UIImageView alloc]initWithFrame:(CGRectMake(15, 20, 25, 25))];
    UILabel *lblName=[[UILabel alloc]initWithFrame:(CGRectMake(55, 20, 150, 30))];
    
    lblName.text = [arrName objectAtIndex:indexPath.row];
    img.image=[UIImage imageNamed:[arrImg objectAtIndex:indexPath.row]];
    img.contentMode = UIViewContentModeScaleAspectFit;
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    [cell.contentView addSubview:img];
    [cell.contentView addSubview:lblName];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath;
{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if(indexPath.row==0)
    {
        MainPageVC *mVc=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
        [self.navigationController pushViewController:mVc animated:YES];
        
    }else if (indexPath.row==1){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        aVC.strG=@"G";
        [self.navigationController pushViewController:aVC animated:YES];
    }else if (indexPath.row==2){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        aVC.strS=@"S";
        [self.navigationController pushViewController:aVC animated:YES];
    }else if (indexPath.row==3){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        aVC.strO=@"O";
        [self.navigationController pushViewController:aVC animated:YES];
    }else if (indexPath.row==4){
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        isShown = false;
        
    }else if (indexPath.row==5){
        [_accountKit logOut];
        NSString *str=@"";
        [appDelegate.user setObject:str forKey:@"firstName"];
        ViewController *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:dVC animated:YES];


    }
    
}
//Payment code

- (IBAction)btnPayment:(id)sender {
    if ([txtPrize.text isEqualToString:@""]) {
        UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"" message:@"Enter Amount!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alt show];
        
    }else{
        [self payU];
    }

    
}
-(void)addPaymentResponseNotofication{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(responseReceived:) name:kPUUINotiPaymentResponse object:nil];
    
}

-(void)responseReceived:(NSNotification *) notification{
    //[self.navigationController popToRootViewControllerAnimated:NO];
    //    self.textFieldTransactionID.text = [PUSAHelperClass getTransactionIDWithLength:15];
    NSString *strConvertedRespone = [NSString stringWithFormat:@"%@",notification.object];
    NSLog(@"Response Received %@",strConvertedRespone);
    
    NSError *serializationError;
    id JSON = [NSJSONSerialization JSONObjectWithData:[strConvertedRespone dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&serializationError];
    if (serializationError == nil && notification.object) {
        NSLog(@"%@",JSON);
       // PAYUALERT([JSON objectForKey:@"status"], strConvertedRespone);
        if ([[JSON objectForKey:@"status"] isEqual:@"success"]) {
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"" message:@"Transaction success" delegate:self
                                             cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alt show];
            NSString *merchant_hash = [JSON objectForKey:@"merchant_hash"];
            if ([[JSON objectForKey:@"card_token"] length] >1 && merchant_hash.length >1 && paymentParam) {
                NSLog(@"Saving merchant hash---->");
                [PUSAHelperClass saveOneTapTokenForMerchantKey:paymentParam.key withCardToken:[JSON objectForKey:@"card_token"] withUserCredential:paymentParam.userCredentials andMerchantHash:merchant_hash withCompletionBlock:^(NSString *message, NSString *errorString) {
                    if (errorString == nil) {
                        NSLog(@"Merchant Hash saved succesfully %@",message);
                    }
                    else{
                        NSLog(@"Error while saving merchant hash %@", errorString);
                    }
                }];
            }
        }else{
            UIAlertView *alt=[[UIAlertView alloc]initWithTitle:@"" message:@"Transaction Fail" delegate:self
        cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alt show];
            
        }
    
    }
    else{
       // PAYUALERT(@"Response", strConvertedRespone);
    }
}
-(void)payU{
    //    if ([_txtAmounts.text isEqualToString:@""]) {
    //        _txtAmounts.text=@"10";
    //
    //    }else{
    //
    //    }
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *stremail=[appDelegate.user stringForKey:@"Email"];
    NSString *strName=[appDelegate.user stringForKey:@"Name"];
    NSString *strMobile=[appDelegate.user stringForKey:@"Mobile"];

    [self randomStringWithLength:15];
    
    PayUModelHashes *hashes = [[PayUModelHashes alloc] init];    paymentParam.hashes = hashes;
    
    paymentParam = [PayUModelPaymentParams new];
    paymentParam.key = @"0MQaQP";//@"0MQaQP";
    //8bC51mIpZ3hJGp1
    
    paymentParam.transactionID =randomTransactionId;
    paymentParam.amount =txtPrize.text;
    paymentParam.productInfo = @"Donate";
    paymentParam.firstName = strName;
    paymentParam.email = stremail;
    paymentParam.userCredentials = (@"0MQaQP:dashrath@gmail.com");
    //    paymentParam.userCredentials = @"ra:ra";

    paymentParam.phoneNumber = strMobile;
    paymentParam.SURL =@"https://payu.herokuapp.com/ios_success";
    paymentParam.FURL =@"https://payu.herokuapp.com/ios_failure";
//    paymentParam.SURL =@"https://www.google.co.in/";
//    paymentParam.FURL =@"http://www.bing.com/";
    paymentParam.udf1 = @"u1";
    paymentParam.udf2 = @"u2";
    paymentParam.udf3 = @"u3";
    paymentParam.udf4 = @"u4";
    paymentParam.udf5 = @"u5";
    paymentParam.environment = ENVIRONMENT_PRODUCTION;
    //paymentParam.offerKey = @"offertest@1411";
    
    [self dismissKeyboard];
    
    [self.defaultActivityIndicator startAnimatingActivityIndicatorWithSelfView:self.view];
    self.view.userInteractionEnabled = NO;
    
    [PUSAHelperClass generateHashFromServer:paymentParam withCompletionBlock:^(PayUModelHashes *hashes, NSString *errorString) {
        [self callSDKWithHashes:hashes withError:errorString];
    }];
    
}
-(void)dismissKeyboard {
    [self.view endEditing:NO];
}
-(void)callSDKWithHashes:(PayUModelHashes *) allHashes withError:(NSString *) errorMessage{
    if (errorMessage == nil) {
        paymentParam.hashes = allHashes;
        [self callSDKWithOneTap:nil];
    }
    else{
        [self.defaultActivityIndicator stopAnimatingActivityIndicator];
        PAYUALERT(@"Error", errorMessage);
    }
}
-(void) callSDKWithOneTap:(NSDictionary *)oneTapDict{
    
    paymentParam.OneTapTokenDictionary = oneTapDict;
    PayUWebServiceResponse *respo = [PayUWebServiceResponse new];
    self.webServiceResponse = [PayUWebServiceResponse new];
    [self.webServiceResponse getPayUPaymentRelatedDetailForMobileSDK:paymentParam withCompletionBlock:^(PayUModelPaymentRelatedDetail *paymentRelatedDetails, NSString *errorMessage, id extraParam) {
        [self.defaultActivityIndicator stopAnimatingActivityIndicator];
        if (errorMessage) {
            PAYUALERT(@"Error", errorMessage);
        }
        else{
            
            [respo callVASForMobileSDKWithPaymentParam:paymentParam];        //FORVAS
            UIStoryboard *stryBrd = [UIStoryboard storyboardWithName:pUUIStoryBoard bundle:nil];
            PUUIPaymentOptionVC * paymentOptionVC = [stryBrd instantiateViewControllerWithIdentifier:VC_IDENTIFIER_PAYMENT_OPTION];
            paymentOptionVC.paymentParam = paymentParam;
            paymentOptionVC.paymentRelatedDetail = paymentRelatedDetails;
//            self.navigationController.navigationBar.translucent=NO;
//            self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
//            self.navigationController.navigationBar.alpha=1.0;
            [self.navigationController pushViewController:paymentOptionVC animated:true];
        }
    }];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (IBAction)btnEditProfile:(id)sender
{
    RegisterVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    aVC.strEditProfile=@"UPDATE";
    [self presentViewController:aVC animated:YES completion:nil];

}
- (IBAction)btn1:(id)sender
{
    txtPrize.text=btn1.titleLabel.text;
    
}
- (IBAction)btn2:(id)sender{
    txtPrize.text=btn2.titleLabel.text;

}
- (IBAction)btn3:(id)sender{
    txtPrize.text=btn3.titleLabel.text;

}
@end

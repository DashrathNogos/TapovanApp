//
//  RegisterVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 26/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "RegisterVC.h"
#import "MainPageVC.h"
@interface RegisterVC ()

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

    textfieldMenu.layer.cornerRadius=3;
    btnRegister.layer.cornerRadius=3;
    av = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    av.frame = CGRectMake(round((self.view.frame.size.width - 40) / 2), round((self.view.frame.size.height - 40) / 2), 40, 40);
    av.tag  = 1;
    av.backgroundColor=[UIColor whiteColor];
    txtFullname.autocapitalizationType = UITextAutocapitalizationTypeWords;

    
    [self.view addSubview:av];
    // Do any additional setup after loading the view.
}
//rnNdUDHUO3qnhgAGf8d6CesvrZwH3wZUfosEap9hJ05DPuRNYUIJVbwNXIg9YW5eB8X8I4vd2tosNubi
//profile updated successfully
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *stremail=[appDelegate.user stringForKey:@"Email"];
    NSString *strName=[appDelegate.user stringForKey:@"Name"];
    NSString *strMobile=[appDelegate.user stringForKey:@"Mobile"];
    [btnRegister setTitle:@"Register" forState:(UIControlStateNormal)];

    txtPassword.text=strMobile;
    txtPassword.enabled=NO;
    if ([_strEditProfile isEqualToString:@"UPDATE"]) {
        [btnRegister setTitle:@"EditProfile" forState:(UIControlStateNormal)];
        txtPassword.text=strMobile;
        txtFullname.text=strName;
        txtEmailAdd.text=stremail;
        
    }else{
    }

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

- (IBAction)btnRegisterCliced:(id)sender {
    [av startAnimating];
    if ([_strEditProfile isEqualToString:@"UPDATE"]) {
        
        [self EditProfile];
    }else{
    //[self RegisterApi];
    }
//    MainPageVC *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
//    [self.navigationController pushViewController:rvc animated:YES];
}
-(void)RegisterApi{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"name": txtFullname.text,@"email": txtEmailAdd.text,@"mobile":txtPassword.text,@"access_token":appDelegate.strTocken};//192.168.1.13//tapovan.devdemoz.com
    
    [manager POST:@"http://tapovan.devdemoz.com/mobapi/profile" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        NSString *msg=[responseObject valueForKey:@"msg"];
        [av stopAnimating];

        if ([msg isEqualToString:@"Register successfully"]) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                            message:msg
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            
            [alert show];
            alert.tag=5;

          
        }else{
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [av stopAnimating];

    }];
}
-(void)EditProfile{
    strToken= [appDelegate.user stringForKey:@"firstName"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"name":txtFullname.text,@"email":txtEmailAdd.text,@"mobile":txtPassword.text,@"access_token":strToken};//192.168.1.13
    
    [manager POST:@"http://tapovan.devdemoz.com/mobapi/profile" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        appDelegate.strMobile=[[NSMutableString alloc]init];
        appDelegate.strEmail=[[NSMutableString alloc]init];
        appDelegate.strName=[[NSMutableString alloc]init];
//        appDelegate.strImg=[[NSMutableString alloc]init];

        appDelegate.strEmail=[responseObject valueForKey:@"email"];
        appDelegate.strName=[responseObject valueForKey:@"name"];
        appDelegate.strMobile=[responseObject valueForKey:@"mobile_number"];
//        appDelegate.strImg=[responseObject valueForKey:@"profile_image"];
        //profile_status=[responseObject valueForKey:@"profile_status"];
        [appDelegate.user setObject: appDelegate.strEmail forKey:@"Email"];
        [appDelegate.user setObject: appDelegate.strName forKey:@"Name"];
//        [appDelegate.user setObject: appDelegate.strImg forKey:@"Images"];
        [appDelegate.user setObject: appDelegate.strMobile forKey:@"Mobile"];
        NSString *msg=[responseObject valueForKey:@"msg"];
        [av stopAnimating];
        
        if ([msg isEqualToString:@"profile updated successfully"]) {
            
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@""
                                                            message:@"profile updated successfully"
                                                           delegate:self
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            alert1.tag=10;
            [alert1 show];
            
            
        }else{
            
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [av stopAnimating];

    }];

}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==5) {
        if (buttonIndex==0) {
            MainPageVC *rvc=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
            // rvc.strUserName=txtFullname.text;
            [appDelegate.user setObject:txtFullname.text forKey:@"userName"];
            
            [self.navigationController pushViewController:rvc animated:YES];
        }
        else
        {
            
        }

    }else if (alertView.tag==10){
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
        
      // Is this my Alert View?
    
}
- (IBAction)btnBackClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == txtFullname) {
        [txtEmailAdd becomeFirstResponder];
    }
    else if (textField==txtEmailAdd){
    [txtPassword becomeFirstResponder];
    }
    [textField resignFirstResponder];

    return YES;

}
/*
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y-50), self.view.frame.size.width, self.view.frame.size.height);
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y+50), self.view.frame.size.width, self.view.frame.size.height);
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y-140), self.view.frame.size.width, self.view.frame.size.height);
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.view.frame = CGRectMake(self.view.frame.origin.x , (self.view.frame.origin.y+140), self.view.frame.size.width, self.view.frame.size.height);
}
 */


//-(void) textFieldDidBeginEditing:(UITextField*)textField
//{
//    
//    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
//    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
//    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
//    CGFloat numerator =  midline - viewRect.origin.y  - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
//    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
//    * viewRect.size.height;
//    CGFloat heightFraction = numerator / denominator;
//    if (heightFraction < 0.0)
//    {
//        heightFraction = 0.0;
//    }
//    else if (heightFraction > 1.0)
//    {
//        heightFraction = 1.0;
//    }
//    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
//    if (orientation == UIInterfaceOrientationPortrait ||
//        orientation == UIInterfaceOrientationPortraitUpsideDown)
//    {
//        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
//    }
//    else
//    {
//        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
//    }
//    CGRect viewFrame = self.view.frame;
//    viewFrame.origin.y -= animatedDistance;
//    
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//    [self.view setFrame:viewFrame];
//    [UIView commitAnimations];
//    
//}
//
//- (BOOL) textFieldShouldEndEditing:(UITextField*)textField
//{
//    CGRect viewFrame = self.view.frame;
//    viewFrame.origin.y += animatedDistance;
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationBeginsFromCurrentState:YES];
//    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
//    [self.view setFrame:viewFrame];
//    [UIView commitAnimations];
//    return YES;
//}


@end

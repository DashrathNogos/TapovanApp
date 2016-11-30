//
//  MainPageVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 26/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "MainPageVC.h"
#import <AccountKit/AccountKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "UIImageView+AFNetworking.h"
#import "AdvancedUIManager.h"
#import "Themes.h"


@interface MainPageVC ()<AKFViewControllerDelegate>

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
@end

@implementation MainPageVC
{
//    AKFAccountKit *_accountKit;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    arrName =[NSArray arrayWithObjects:@"Dashboard",@"Gurukul",@"School",@"Others",@"Donations",@"Logout", nil];
    arrImg =[NSArray arrayWithObjects:@"menu1.png",@"gurukul-sidebar.png",@"school-sidebar.png",@"other-sidebar.png",@"menu5.png",@"menu6.png", nil];
//    progress = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    progress.backgroundColor=[UIColor whiteColor];
    progress.layer.cornerRadius=15;
    progress.hidden=YES;
//    UIImage *profileImg=[appDelegate.user stringForKey:@"profileImage"];
    //UIImage *imagePath = [appDelegate.user objectForKey:@"profileImage"];

    
    //profileImage.image = imagePath;

    
    
//    profileImage.layer.cornerRadius = 55;
    profileImage.clipsToBounds = YES;
    profileImage.layer.borderWidth = 4.0f;
    profileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    profileImage.layer.cornerRadius = 70;
    profileImage.layer.masksToBounds = YES;
    //profileImage.layer.cornerRadius = profileImage.frame.size.height / 2;
   // profileImage.clipsToBounds = YES;
    //profileImage.layer.masksToBounds = false;

//    profileImage.layer.cornerRadius = profileImage.frame.size.width / 2;
//    profileImage.clipsToBounds = true;
//   
   //profileImage.layer.cornerRadius =  i;
//    profileImage.clipsToBounds = YES;
    sideProfileImg.layer.cornerRadius = 50;
    sideProfileImg.clipsToBounds = YES;
    sideProfileImg.layer.borderWidth = 2.0f;
    sideProfileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [recognizer setNumberOfTapsRequired:1];
    //lblName.userInteractionEnabled = true;  (setting this in Interface Builder)
    [mainView addGestureRecognizer:recognizer];
    screenRect = [[UIScreen mainScreen] bounds];
    
//    NSString *profileImg=[appDelegate.user stringForKey:@"profileImg"];
//    if(profileImg== (id)[NSNull null] ||[profileImg isEqualToString:@""]||profileImg==nil){
//        profileImage.image=[UIImage imageNamed:@"gender_profile.png"];
//        sideProfileImg.image=[UIImage imageNamed:@"gender_profile.png"];
//    }else{
    
    

    
    //}
    
//    profileImage.image = appDelegate.strProfileimg;
//    sideProfileImg.image = appDelegate.strProfileimg;
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable)
    {
        //connection unavailable
        UIAlertView *net=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Check Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [net show];
        
    }
    else
    {
    }
   }
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

    NSString *strLogin=[appDelegate.user stringForKey:@"Images"];
    [profileImage setImageWithURL:[NSURL URLWithString:strLogin]
                 placeholderImage:[UIImage imageNamed:@"gender_profile.png"]];
    //       profileImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strLogin]]];
    //
    [sideProfileImg setImageWithURL:[NSURL URLWithString:strLogin]
                   placeholderImage:[UIImage imageNamed:@"gender_profile.png"]];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *strName=[appDelegate.user stringForKey:@"Name"];
    lblUserName.text=strName;
    lblSidebarName.text=strName;

    
//    [UIView animateWithDuration:.01f delay:0.0 options:0
//                     animations:^{
//                         [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
//                         
//                     }
//                     completion:^(BOOL finished){
//                     }];
//    [UIView animateWithDuration:.01f delay:0.0 options:0
//                     animations:^{
//                         [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
//                         
//                     }
//                     completion:^(BOOL finished){
//                     }];
//    
//    isShown = false;


}

- (NSString *)encodeToBase64String:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
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
- (void)takePhoto {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    } else {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePicker animated:YES completion:nil];
//        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.delegate = self;
//        picker.allowsEditing = YES;
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        NSArray *mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeLivePhoto];
//        picker.mediaTypes = mediaTypes;
//        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    
}
- (void)selectPhoto {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
//    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    picker.allowsEditing = NO;
//    picker.delegate = self;
//    
//    // make sure we include Live Photos (otherwise we'll only get UIImages)
//    NSArray *mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeLivePhoto];
//    picker.mediaTypes = mediaTypes;
//    
//    // bring up the picker
//    [self presentViewController:picker animated:YES completion:nil];
//    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  appDelegate.strProfileimg  = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self centerCropImage:appDelegate.strProfileimg]; //Just give your image here for cropping

//    appDelegate.strProfileimg  = [self cropImage:croppedImage andFrame:CGRectMake(0, 0, 150, 150)];
//    profileImage.image = appDelegate.strProfileimg;
//    sideProfileImg.image = appDelegate.strProfileimg;
    [progress startAnimating];
    progress.hidden=NO;
    [self uploadPhoto];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
-(UIImage *)centerCropImage:(UIImage *)image
{
    // Use smallest side length as crop square length
    CGFloat squareLength = MIN(image.size.width, image.size.height);
    // Center the crop area
    CGRect clippedRect = CGRectMake((image.size.width - squareLength) / 2, (image.size.height - squareLength) / 2, squareLength, squareLength);
    // Crop logic
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], clippedRect);
    UIImage * croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}
//- (UIImage *)cropImage:(UIImage*)image andFrame:(CGRect)rect {
//    
//    //Note : rec is nothing but the image frame which u want to crop exactly.
//    
//    rect = CGRectMake(rect.origin.x*image.scale,
//                      rect.origin.y*image.scale,
//                      rect.size.width*image.scale,
//                      rect.size.height*image.scale);
//    
//    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], rect);
//    UIImage *result = [UIImage imageWithCGImage:imageRef
//                                          scale:image.scale
//                                    orientation:image.imageOrientation];
//    CGImageRelease(imageRef);
//    return result;
//}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
   // [self dismissModalViewControllerAnimated:YES];

    [picker dismissViewControllerAnimated:YES completion:NULL];
    //[[picker parentViewController] dismissModalViewControllerAnimated:YES];

}
-(void)uploadPhoto{//tapovan.devdemoz.com
    strToken= [appDelegate.user stringForKey:@"firstName"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://tapovan.devdemoz.com/mobapi/profileimage"]];
    NSData *imageData = UIImageJPEGRepresentation(appDelegate.strProfileimg, 0.5);
    NSString *bytCode=[imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    NSDictionary *parameters = @{@"access_token":strToken, @"bytecode" :bytCode};
    AFHTTPRequestOperation *op = [manager POST:@"http://tapovan.devdemoz.com/mobapi/profileimage" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //do not put image inside parameters dictionary as I did, but append it!
        [formData appendPartWithFileData:imageData name:@"avatar" fileName:@"avatar.jpg" mimeType:@"image/jpeg"];

        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        [progress stopAnimating];
        progress.hidden=YES;
        profileImage.image = appDelegate.strProfileimg;
        sideProfileImg.image = appDelegate.strProfileimg;
        strImg=[responseObject valueForKey:@"link"];
        [appDelegate.user setObject:strImg forKey:@"Images"];


    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [progress stopAnimating];
        progress.hidden=YES;
       // NSLog(@"Error: %@ ***** %@", operation.responseString, error);
    }];
    [op start];
}
//- (UIImage *)croppIngimageByImageName:(UIImage *)imageToCrop toRect:(CGRect)rect
//{
//    //CGRect CropRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+15);
//    
//    CGImageRef imageRef = CGImageCreateWithImageInRect([imageToCrop CGImage], rect);
//    UIImage *cropped = [UIImage imageWithCGImage:imageRef];
//    CGImageRelease(imageRef);
//    
//    return cropped;
//}
- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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

- (IBAction)btnCameraClicked:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@""
                                                             delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Take Photo With Camera", @"Select Photo From Gallary", @"Cancel", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    //actionSheet.destructiveButtonIndex = 1;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self takePhoto];
    }
    else if (buttonIndex == 1)
    {
        [self selectPhoto];
    }
    
    else if (buttonIndex == 2)
    {
        NSLog(@"cancel");
    }
}

- (IBAction)btnSideMenu:(id)sender {
    _tblSideView.hidden=NO;
    CGRect screenRect = [[UIScreen mainScreen] bounds];

     if (!isShown)
    {

        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblSideView setFrame:CGRectMake(0, _tblSideView.frame.origin.y,screenRect.size.width-45, _tblSideView.frame.size.height)];
                         }
                         completion:^(BOOL finished){
                         }];
        
            [UIView animateWithDuration:.25f delay:0.0 options:0
                             animations:^{
                                 [mainView setFrame:CGRectMake( screenRect.size.width-45, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
        
                             }
                             completion:^(BOOL finished){
                             }];
        

        
        isShown = true;
    }else{
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

    }

//    [UIView animateWithDuration:.25f delay:0.0 options:0
//                     animations:^{
//                         [mainView setFrame:CGRectMake(160, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
//                         
//                     }
//                     completion:^(BOOL finished){
//                     }];

    
//    [UIView animateWithDuration:.50f delay:0.0 options:0
//                     animations:^{
//                         [_tblSideView setFrame:CGRectMake(0, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
//                         
//                     }
//                     completion:^(BOOL finished){
//                     }];

 //   _tblSideView.hidden=NO;

}

- (IBAction)btnsideClose:(id)sender {
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

    isShown = false;

   // _tblSideView.hidden=YES;
}

- (IBAction)btnEditProfile:(id)sender {
    RegisterVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
   aVC.strEditProfile=@"UPDATE";
    [self presentViewController:aVC animated:YES completion:nil];
    
   }

- (IBAction)btnGurukulCorner:(id)sender {
    ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
    aVC.strG=@"G";
    [self.navigationController pushViewController:aVC animated:YES];
}

- (IBAction)btnSchoolCorner:(id)sender {
    ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
    aVC.strS=@"S";

    [self.navigationController pushViewController:aVC animated:YES];
}

- (IBAction)btnOtherCorner:(id)sender {
    ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
    aVC.strO=@"O";

    [self.navigationController pushViewController:aVC animated:YES];
}

- (IBAction)btnDonationClicked:(id)sender {
    DonationVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DonationVC"];
    [self.navigationController pushViewController:dVC animated:YES];
}

//Tableview Manage
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    if(indexPath.row==0)
    {
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
        
      
        DonationVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DonationVC"];
        
        [self.navigationController pushViewController:dVC animated:YES];
        
    }else if (indexPath.row==5){
        [_accountKit logOut];
        NSString *str=@"";
        [appDelegate.user setObject:str forKey:@"firstName"];

       ViewController *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:dVC animated:YES];
        
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath;
{
    return 50;
}

- (void)_prepareLoginViewController:(UIViewController<AKFViewController> *)loginViewController
{
    loginViewController.advancedUIManager = _useAdvancedUIManager ? _advancedUIManager : nil;
    loginViewController.delegate = self;
    loginViewController.theme = _theme;
}

@end

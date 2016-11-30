//
//  StudentCornerVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 28/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "StudentCornerVC.h"

@interface StudentCornerVC ()

@end

@implementation StudentCornerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

    arrName =[NSArray arrayWithObjects:@"Dashboard",@"Activities",@"Students Corner",@"Notifications",@"Donations",@"Logout", nil];
    arrImg =[NSArray arrayWithObjects:@"menu1.png",@"menu2.png",@"menu3.png",@"menu4.png",@"menu5.png",@"menu6.png", nil];
    
    
    sideProfileImg.layer.cornerRadius = 50;
    sideProfileImg.clipsToBounds = YES;
    sideProfileImg.layer.borderWidth = 2.0f;
    sideProfileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    //sideProfileImg.image=appDelegate.strProfileimg;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [recognizer setNumberOfTapsRequired:1];
    //lblName.userInteractionEnabled = true;  (setting this in Interface Builder)
    [mainView addGestureRecognizer:recognizer];
    screenRect = [[UIScreen mainScreen] bounds];
//SidebarMenuImages
    NSString *strLogin=[appDelegate.user stringForKey:@"profileImg"];
    
    [sideProfileImg setImageWithURL:[NSURL URLWithString:strLogin]
                   placeholderImage:[UIImage imageNamed:@"gender_profile_grey.png"]];
    

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
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:100];
    
  titleLabel.text=@"Tapovan";
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    ViewControllerThree *view =
//    [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThree"];
//    [self.navigationController pushViewController:view animated:YES];
}
//sidemenu Manage
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
- (IBAction)btnSideMenu:(id)sender{
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
                             [mainView setFrame:CGRectMake(screenRect.size.width-45, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
                             
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
                             [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView .frame.size.width, mainView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        isShown = false;
        
    }
    
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
                         [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView .frame.size.width, mainView.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    isShown = false;
    
    // _tblSideView.hidden=YES;
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
    [cell.contentView addSubview:btnNotification];
    
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
    

    cell.textLabel.text = [arrName objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:[arrImg objectAtIndex:indexPath.row]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    
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
        MainPageVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
        [self.navigationController pushViewController:aVC animated:YES];
    }else if (indexPath.row==1){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        [self.navigationController pushViewController:aVC animated:YES];
        
        
    }else if (indexPath.row==2){
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

    }else if (indexPath.row==3){
        NotificationVC *nVC=[self.storyboard instantiateViewControllerWithIdentifier:@"NotificationVC"];
        [self.navigationController pushViewController:nVC animated:YES];
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


@end

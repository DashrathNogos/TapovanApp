//
//  NotificationVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 09/11/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "NotificationVC.h"
#import "MainPageVC.h"
#import "ActivityVC.h"
#import "StudentCornerVC.h"
#import "DonationVC.h"

@interface NotificationVC ()

@end

@implementation NotificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    arrName =[NSArray arrayWithObjects:@"Dashboard",@"Activities",@"Students Corner",@"Notifications",@"Donations",@"Logout", nil];
    arrImg =[NSArray arrayWithObjects:@"menu1.png",@"menu2.png",@"menu3.png",@"menu4.png",@"menu5.png",@"menu6.png", nil];
    screenRects = [[UIScreen mainScreen] bounds];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_tblsideMenu) {
        return arrName.count;
    }
    return 14;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    static NSString *simpleTableIdentifier1 = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier1];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier1];
    }

    if (tableView==_tblsideMenu) {
        UIButton *btnNotification=[[UIButton alloc]initWithFrame:(CGRectMake(screenRects.size.width-100, 7, 34, 34))];
        btnNotification.layer.cornerRadius = 17; // this value vary as per your desire
        btnNotification.clipsToBounds = YES;
        [btnNotification  setTintColor:[UIColor blackColor]];
        [cell1.contentView addSubview:btnNotification];
        
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
        
        cell1.textLabel.text = [arrName objectAtIndex:indexPath.row];
        cell1.imageView.image=[UIImage imageNamed:[arrImg objectAtIndex:indexPath.row]];
        cell1.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        return cell1;
        
    }else{
        
    }
   
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (tableView==_tblsideMenu) {
        
    
    if(indexPath.row==0)
    {
        MainPageVC *nVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
        [self.navigationController pushViewController:nVC animated:YES];
        
    }else if (indexPath.row==1){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        [self.navigationController pushViewController:aVC animated:YES];
        
        
    }else if (indexPath.row==2){
        StudentCornerVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"StudentCornerVC"];
        [self.navigationController pushViewController:aVC animated:YES];
        
    }else if (indexPath.row==3){
        
        [UIView animateWithDuration:.25f delay:0.0 options:0
                                                                                          animations:^{
                                                                                              [_tblsideMenu setFrame:CGRectMake(-screenRect.size.width-45, _tblsideMenu.frame.origin.y, _tblsideMenu.frame.size.width, _tblsideMenu.frame.size.height)];
                                                                                              
                                                                                          }
                                                                                          completion:^(BOOL finished){
                                                                                          }];
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [menuView setFrame:CGRectMake(0, menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        isShown = false;

    }else if (indexPath.row==4){
        
        
        DonationVC *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"DonationVC"];
        [self.navigationController pushViewController:dVC animated:YES];
        
    }else if (indexPath.row==5){
        appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];

        [_accountKit logOut];
        NSString *str=@"";
        [appDelegate.user setObject:str forKey:@"firstName"];
        
        ViewController *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:dVC animated:YES];
        
    }
    }else{
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath;
{
    if (tableView==_tblsideMenu) {
        return 50;
    }
    return 101;
    
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

- (IBAction)btnSideMenuClicked:(id)sender {
    _tblsideMenu.hidden=NO;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if (!isShown)
    {
        
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblsideMenu setFrame:CGRectMake(0, _tblsideMenu.frame.origin.y,screenRect.size.width-45, _tblsideMenu.frame.size.height)];
                         }
                         completion:^(BOOL finished){
                         }];
        
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [menuView setFrame:CGRectMake( screenRect.size.width-45, menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        
        isShown = true;
    }else{
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [_tblsideMenu setFrame:CGRectMake(-screenRect.size.width-45, _tblsideMenu.frame.origin.y, _tblsideMenu.frame.size.width, _tblsideMenu.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        [UIView animateWithDuration:.25f delay:0.0 options:0
                         animations:^{
                             [menuView setFrame:CGRectMake(0, menuView.frame.origin.y, menuView.frame.size.width, menuView.frame.size.height)];
                             
                         }
                         completion:^(BOOL finished){
                         }];
        
        
        isShown = false;
    }
}

- (IBAction)btnSidemenuCloseClicked:(id)sender {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [_tblsideMenu setFrame:CGRectMake(-screenRect.size.width-45, _tblsideMenu.frame.origin.y, _tblsideMenu.frame.size.width, _tblsideMenu.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:.25f delay:0.0 options:0
                     animations:^{
                         [self.view setFrame:CGRectMake(0, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    isShown = false;

}
@end

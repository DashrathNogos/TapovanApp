//
//  ActivityVC.m
//  Tapovan
//
//  Created by Jimit Bagadiya on 27/10/16.
//  Copyright © 2016 Jimit Bagadiya. All rights reserved.
//

#import "ActivityVC.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define kDefaultEdgeInsets UIEdgeInsetsMake(5, 100, 25, 10)
@interface ActivityVC ()

@end

@implementation ActivityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;

    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    menuScrollView.delegate = self;

    gurukulView.backgroundColor=[UIColor whiteColor];
    schoolView.backgroundColor=[UIColor whiteColor];
    otherView.backgroundColor=[UIColor whiteColor];
    lblTitle.text=@"Gurukul Activities";
//Tableview Manage
     arrName =[NSArray arrayWithObjects:@"Dashboard",@"Gurukul",@"School",@"Others",@"Donations",@"Logout", nil];
    arrImg =[NSArray arrayWithObjects:@"menu1.png",@"gurukul-sidebar.png",@"school-sidebar.png",@"other-sidebar.png",@"menu5.png",@"menu6.png", nil];
    
    
    sideProfileImg.layer.cornerRadius = 50;
    sideProfileImg.clipsToBounds = YES;
    sideProfileImg.layer.borderWidth = 2.0f;
    sideProfileImg.layer.borderColor = [UIColor whiteColor].CGColor;
    sideProfileImg.image=appDelegate.strProfileimg;
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [recognizer setNumberOfTapsRequired:1];
    //lblName.userInteractionEnabled = true;  (setting this in Interface Builder)
    //[mainView addGestureRecognizer:recognizer];
    btnArray = @[@"Menu One", @"Menu Two", @"Menu Three more long button", @"Menu Four"];
    
  //  [self addButtonsInScrollMenu:btnArray];
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    GurukulVC *oneVC = [storyBoard instantiateViewControllerWithIdentifier:@"GurukulVC"];
    SchoolVC *twoVC = [storyBoard instantiateViewControllerWithIdentifier:@"SchoolVC"];
    OtherVC *thirdVC = [storyBoard instantiateViewControllerWithIdentifier:@"OtherVC"];
    NSArray *controllerArray = @[oneVC, twoVC, thirdVC];
    [self addChildViewControllersOntoContainer:controllerArray];
    screenRect = [[UIScreen mainScreen] bounds];
//ImageSideMenu
    NSString *strLogin=[appDelegate.user stringForKey:@"Images"];

    [sideProfileImg setImageWithURL:[NSURL URLWithString:strLogin]
                   placeholderImage:[UIImage imageNamed:@"gender_profile_grey.png"]];
    NSString *strName=[appDelegate.user stringForKey:@"Name"];
    lblSidebarName.text=strName;
    if ([_strG isEqualToString:@"G"]) {
        _strG=@"";
        [btngurukul setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=NO;
        otherView.hidden=YES;
        schoolView.hidden=YES;
        lblTitle.text=@"Gurukul Activities";
        imggurukul.image=[UIImage imageNamed:@"gurukul_active.png"];
        imgschool.image=[UIImage imageNamed:@"school.png"];
        imgother.image=[UIImage imageNamed:@"other.png"];
        
        
        homeView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        mgurukulView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        mschoolView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        motherView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        navigationView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 0, 0) animated:YES];

    }
    else if ([_strS isEqualToString:@"S"])
    {
        _strS=@"";
        [btnschool setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=YES;
        otherView.hidden=YES;
        schoolView.hidden=NO;
        lblTitle.text=@"School Activities";
        
        imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
        imgschool.image=[UIImage imageNamed:@"school_active.png"];
        imgother.image=[UIImage imageNamed:@"other.png"];
        
        homeView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        
        mgurukulView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        
        mschoolView.backgroundColor = [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        
        motherView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        navigationView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 1, 0) animated:YES];

    }else if ([_strO isEqualToString:@"O"]){
        _strO=@"";
        [btnother setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=YES;
        otherView.hidden=NO;
        schoolView.hidden=YES;
        lblTitle.text=@"Other Activities";
        
        imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
        imgschool.image=[UIImage imageNamed:@"school.png"];
        imgother.image=[UIImage imageNamed:@"other_active.png"];
        
        homeView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        mgurukulView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        mschoolView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        motherView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        navigationView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];

    }else{
        
    }
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *strLogin=[appDelegate.user stringForKey:@"Images"];
       [sideProfileImg setImageWithURL:[NSURL URLWithString:strLogin]
                   placeholderImage:[UIImage imageNamed:@"gender_profile.png"]];
    appDelegate= (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSString *strName=[appDelegate.user stringForKey:@"Name"];
    lblSidebarName.text=strName;
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

- (IBAction)btnSidemenu:(id)sender {
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
    
}

- (IBAction)btnGurukulClicked:(id)sender{

    [btngurukul setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    gurukulView.hidden=NO;
    otherView.hidden=YES;
    schoolView.hidden=YES;
    lblTitle.text=@"Gurukul Activities";
    imggurukul.image=[UIImage imageNamed:@"gurukul_active.png"];
    imgschool.image=[UIImage imageNamed:@"school.png"];
    imgother.image=[UIImage imageNamed:@"other.png"];
    
   
     homeView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
     mgurukulView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
     mschoolView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
     motherView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
     navigationView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
    [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 0, 0) animated:YES];

    
    
}
- (IBAction)btnSchoolCliked:(id)sender{

    [btnschool setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    gurukulView.hidden=YES;
    otherView.hidden=YES;
    schoolView.hidden=NO;
    lblTitle.text=@"School Activities";

    imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
    imgschool.image=[UIImage imageNamed:@"school_active.png"];
    imgother.image=[UIImage imageNamed:@"other.png"];

    homeView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];

    mgurukulView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];

    mschoolView.backgroundColor = [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];

    motherView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    navigationView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 1, 0) animated:YES];

}

- (IBAction)btnotherClicked:(id)sender;{

    [btnother setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
    gurukulView.hidden=YES;
    otherView.hidden=NO;
    schoolView.hidden=YES;
    lblTitle.text=@"Other Activities";

    imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
    imgschool.image=[UIImage imageNamed:@"school.png"];
    imgother.image=[UIImage imageNamed:@"other_active.png"];

    homeView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
    mgurukulView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
    mschoolView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
    motherView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
    navigationView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
    [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 2, 0) animated:YES];

}
//sidemenu
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
   // [cell.contentView addSubview:btnNotification];
    
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
        MainPageVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"MainPageVC"];
        [self.navigationController pushViewController:aVC animated:YES];
    }else if (indexPath.row==1){
        ActivityVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"ActivityVC"];
        aVC.strG=@"G";
        [self.navigationController pushViewController:aVC animated:YES];

//        [UIView animateWithDuration:.25f delay:0.0 options:0
//                         animations:^{
//                             [_tblSideView setFrame:CGRectMake(-screenRect.size.width-45, _tblSideView.frame.origin.y, _tblSideView.frame.size.width, _tblSideView.frame.size.height)];
//                             
//                         }
//                         completion:^(BOOL finished){
//                         }];
//        [UIView animateWithDuration:.25f delay:0.0 options:0
//                         animations:^{
//                             [mainView setFrame:CGRectMake(0, mainView.frame.origin.y, mainView.frame.size.width, mainView.frame.size.height)];
//                             
//                         }
//                         completion:^(BOOL finished){
//                         }];
//        
//        
//        isShown = false;

        
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

//Scrolling
-(void) addChildViewControllersOntoContainer:(NSArray *)controllersArr
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    for (int i = 0 ; i < controllersArr.count; i++)
    {
        UIViewController *vc = (UIViewController *)[controllersArr objectAtIndex:i];
        CGRect frame = CGRectMake(0, 0, menuScrollView.frame.size.width, menuScrollView.frame.size.height);
        frame.origin.x = SCREEN_WIDTH * i;
        vc.view.frame = frame;
        
        [self addChildViewController:vc];
        [menuScrollView addSubview:vc.view];
        [vc didMoveToParentViewController:self];
    }
    menuScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * controllersArr.count + 1, menuScrollView.frame.size.height);
    menuScrollView.pagingEnabled = YES;
    menuScrollView.delegate = self;
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGRect screenRect1 = [[UIScreen mainScreen] bounds];
    
    int page = (scrollView.contentOffset.x / 300);
    if (page==0) {
        [btngurukul setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=NO;
        otherView.hidden=YES;
        schoolView.hidden=YES;
        lblTitle.text=@"Gurukul Activities";
        imggurukul.image=[UIImage imageNamed:@"gurukul_active.png"];
        imgschool.image=[UIImage imageNamed:@"school.png"];
        imgother.image=[UIImage imageNamed:@"other.png"];
        homeView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        mgurukulView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        mschoolView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        motherView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        navigationView.backgroundColor =  [UIColor colorWithRed:(63.0 / 255.0) green:(192.0 / 255.0) blue:(215.0 / 255.0) alpha: 1];
        [menuScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * 0, 0) animated:YES];
//        
//        [menuScrollView setContentOffset:CGPointMake(screenRect1.size.width * 0+10, 0) animated:YES];
//        [menuScrollView scrollRectToVisible:CGRectMake(15, 118, SCREEN_WIDTH, 445) animated:YES];
    
//

    }else if (page==1){
        [btnschool setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btnother setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=YES;
        otherView.hidden=YES;
        schoolView.hidden=NO;
        lblTitle.text=@"School Activities";
    
        imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
        imgschool.image=[UIImage imageNamed:@"school_active.png"];
        imgother.image=[UIImage imageNamed:@"other.png"];
        homeView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    
        mgurukulView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    
        mschoolView.backgroundColor = [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    
        motherView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
        navigationView.backgroundColor =  [UIColor colorWithRed:(65.0 / 255.0) green:(192.0 / 255.0) blue:(175.0 / 255.0) alpha: 1];
    
    
        //float xx = scrollView.contentOffset.x * (buttonWidth / SCREEN_WIDTH) - buttonWidth;
//        [menuScrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH+10, 118, SCREEN_WIDTH, menuScrollView.frame.size.height) animated:YES];
//    
//        [menuScrollView setContentOffset:CGPointMake(screenRect1.size.width * 1, 0) animated:YES];
//        [menuScrollView scrollRectToVisible:CGRectMake(350, 118, SCREEN_WIDTH,300) animated:YES];

    }else if(page==2){
        [btnother setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [btngurukul setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        [btnschool setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        gurukulView.hidden=YES;
       otherView.hidden=NO;
        schoolView.hidden=YES;
       lblTitle.text=@"Other Activities";
    
        imggurukul.image=[UIImage imageNamed:@"gurukul.png"];
        imgschool.image=[UIImage imageNamed:@"school.png"];
        imgother.image=[UIImage imageNamed:@"other_active.png"];
//        
        homeView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        mgurukulView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        mschoolView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        motherView.backgroundColor =  [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
        navigationView.backgroundColor = [UIColor colorWithRed:(243.0 / 255.0) green:(174.0 / 255.0) blue:(78.0 / 255.0) alpha: 1];
//        [menuScrollView setContentOffset:CGPointMake(screenRect1.size.width * 2, 0) animated:YES];
//        [menuScrollView scrollRectToVisible:CGRectMake(750, 118, SCREEN_WIDTH-100,445) animated:YES];
    

   }else{
    
    }

}
- (IBAction)btnEditProfile:(id)sender
{
    RegisterVC *aVC=[self.storyboard instantiateViewControllerWithIdentifier:@"RegisterVC"];
    aVC.strEditProfile=@"UPDATE";
    [self presentViewController:aVC animated:YES completion:nil];

}

@end
